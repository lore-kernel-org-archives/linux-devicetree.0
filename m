From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH v2 03/14] dmaengine: doc: Add sections for per descriptor metadata support
Date: Tue, 30 Jul 2019 12:34:39 +0300
Message-ID: <20190730093450.12664-4-peter.ujfalusi@ti.com>
References: <20190730093450.12664-1-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190730093450.12664-1-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org, robh+dt@kernel.org, nm@ti.com, ssantosh@kernel.org
Cc: dan.j.williams@intel.com, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, grygorii.strashko@ti.com, lokeshvutla@ti.com, t-kristo@ti.com, tony@atomide.com, j-keerthy@ti.com
List-Id: devicetree@vger.kernel.org

Update the provider and client documentation with details about the
metadata support.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 Documentation/driver-api/dmaengine/client.rst | 75 +++++++++++++++++++
 .../driver-api/dmaengine/provider.rst         | 46 ++++++++++++
 2 files changed, 121 insertions(+)

diff --git a/Documentation/driver-api/dmaengine/client.rst b/Documentation/driver-api/dmaengine/client.rst
index 45953f171500..d708e46b88a2 100644
--- a/Documentation/driver-api/dmaengine/client.rst
+++ b/Documentation/driver-api/dmaengine/client.rst
@@ -151,6 +151,81 @@ The details of these operations are:
      Note that callbacks will always be invoked from the DMA
      engines tasklet, never from interrupt context.
 
+  Optional: per descriptor metadata
+  ---------------------------------
+  DMAengine provides two ways for metadata support.
+
+  DESC_METADATA_CLIENT
+
+    The metadata buffer is allocated/provided by the client driver and it is
+    attached to the descriptor.
+
+  .. code-block:: c
+
+     int dmaengine_desc_attach_metadata(struct dma_async_tx_descriptor *desc,
+				   void *data, size_t len);
+
+  DESC_METADATA_ENGINE
+
+    The metadata buffer is allocated/managed by the DMA driver. The client
+    driver can ask for the pointer, maximum size and the currently used size of
+    the metadata and can directly update or read it.
+
+  .. code-block:: c
+
+     void *dmaengine_desc_get_metadata_ptr(struct dma_async_tx_descriptor *desc,
+		size_t *payload_len, size_t *max_len);
+
+     int dmaengine_desc_set_metadata_len(struct dma_async_tx_descriptor *desc,
+		size_t payload_len);
+
+  Client drivers can query if a given mode is supported with:
+
+  .. code-block:: c
+
+     bool dmaengine_is_metadata_mode_supported(struct dma_chan *chan,
+		enum dma_desc_metadata_mode mode);
+
+  Depending on the used mode client drivers must follow different flow.
+
+  DESC_METADATA_CLIENT
+
+    - DMA_MEM_TO_DEV / DEV_MEM_TO_MEM:
+      1. prepare the descriptor (dmaengine_prep_*)
+         construct the metadata in the client's buffer
+      2. use dmaengine_desc_attach_metadata() to attach the buffer to the
+         descriptor
+      3. submit the transfer
+    - DMA_DEV_TO_MEM:
+      1. prepare the descriptor (dmaengine_prep_*)
+      2. use dmaengine_desc_attach_metadata() to attach the buffer to the
+         descriptor
+      3. submit the transfer
+      4. when the transfer is completed, the metadata should be available in the
+         attached buffer
+
+  DESC_METADATA_ENGINE
+
+    - DMA_MEM_TO_DEV / DEV_MEM_TO_MEM:
+      1. prepare the descriptor (dmaengine_prep_*)
+      2. use dmaengine_desc_get_metadata_ptr() to get the pointer to the
+         engine's metadata area
+      3. update the metadata at the pointer
+      4. use dmaengine_desc_set_metadata_len()  to tell the DMA engine the
+         amount of data the client has placed into the metadata buffer
+      5. submit the transfer
+    - DMA_DEV_TO_MEM:
+      1. prepare the descriptor (dmaengine_prep_*)
+      2. submit the transfer
+      3. on transfer completion, use dmaengine_desc_get_metadata_ptr() to get the
+         pointer to the engine's metadata are
+      4. Read out the metadate from the pointer
+
+  .. note::
+
+     Mixed use of DESC_METADATA_CLIENT / DESC_METADATA_ENGINE is not allowed,
+     client drivers must use either of the modes per descriptor.
+
 4. Submit the transaction
 
    Once the descriptor has been prepared and the callback information
diff --git a/Documentation/driver-api/dmaengine/provider.rst b/Documentation/driver-api/dmaengine/provider.rst
index dfc4486b5743..9e6d87b3c477 100644
--- a/Documentation/driver-api/dmaengine/provider.rst
+++ b/Documentation/driver-api/dmaengine/provider.rst
@@ -247,6 +247,52 @@ after each transfer. In case of a ring buffer, they may loop
 (DMA_CYCLIC). Addresses pointing to a device's register (e.g. a FIFO)
 are typically fixed.
 
+Per descriptor metadata support
+-------------------------------
+Some data movement architecure (DMA controller and peripherals) uses metadata
+associated with a transaction. The DMA controller role is to transfer the
+payload and the metadata alongside.
+The metadata itself is not used by the DMA engine itself, but it contains
+parameters, keys, vectors, etc for peripheral or from the peripheral.
+
+The DMAengine framework provides a generic ways to facilitate the metadata for
+descriptors. Depending on the architecture the DMA driver can implement either
+or both of the methods and it is up to the client driver to choose which one
+to use.
+
+- DESC_METADATA_CLIENT
+
+  The metadata buffer is allocated/provided by the client driver and it is
+  attached (via the dmaengine_desc_attach_metadata() helper to the descriptor.
+
+  From the DMA driver the following is expected for this mode:
+  - DMA_MEM_TO_DEV / DEV_MEM_TO_MEM
+    The data from the provided metadata buffer should be prepared for the DMA
+    controller to be sent alongside of the payload data. Either by copying to a
+    hardware descriptor, or highly coupled packet.
+  - DMA_DEV_TO_MEM
+    On transfer completion the DMA driver must copy the metadata to the client
+    provided metadata buffer.
+
+- DESC_METADATA_ENGINE
+
+  The metadata buffer is allocated/managed by the DMA driver. The client driver
+  can ask for the pointer, maximum size and the currently used size of the
+  metadata and can directly update or read it. dmaengine_desc_get_metadata_ptr()
+  and dmaengine_desc_set_metadata_len() is provided as helper functions.
+
+  From the DMA driver the following is expected for this mode:
+  - get_metadata_ptr
+    Should return a pointer for the metadata buffer, the maximum size of the
+    metadata buffer and the currently used / valid (if any) bytes in the buffer.
+  - set_metadata_len
+    It is called by the clients after it have placed the metadata to the buffer
+    to let the DMA driver know the number of valid bytes provided.
+
+  Note: since the client will ask for the metadata pointer in the completion
+  callback (in DMA_DEV_TO_MEM case) the DMA driver must ensure that the
+  descriptor is not freed up prior the callback is called.
+
 Device operations
 -----------------
 
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
