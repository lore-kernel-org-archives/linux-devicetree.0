From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v20 03/10] add bindings document for altera freeze bridge
Date: Tue, 18 Oct 2016 11:26:56 -0500
Message-ID: <20161018162656.dsx7hnip3xqm7j26@rob-hp-laptop>
References: <20161017160941.4205-1-atull@opensource.altera.com>
 <20161017160941.4205-4-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161017160941.4205-4-atull@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: Alan Tull <atull@opensource.altera.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Moritz Fischer <moritz.fischer@ettus.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jon Masters <jcm@redhat.com>, Michal Simek <michal.simek@xilinx.com>, Jonathan Corbet <corbet@lwn.net>, Cyril Chemparathy <cyril.chemparathy@xilinx.com>, Matthew Gerlach <mgerlach@opensource.altera.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, delicious.quinoa@gmail.com
List-Id: devicetree@vger.kernel.org

On Mon, Oct 17, 2016 at 11:09:34AM -0500, Alan Tull wrote:
> Add bindings document for the Altera Freeze Bridge.  A Freeze
> Bridge is used to gate traffic to/from a region of a FPGA
> such that that region can be reprogrammed.  The Freeze Bridge
> exist in FPGA fabric that is not currently being reconfigured.
> 
> Signed-off-by: Alan Tull <atull@opensource.altera.com>
> Signed-off-by: Matthew Gerlach <mgerlach@opensource.altera.com>
> ---
> v19: Added in v19 of patchset, uses fpga image info struct
> v20: fix one underscore to hyphen
> ---
>  .../bindings/fpga/altera-freeze-bridge.txt         | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fpga/altera-freeze-bridge.txt

Acked-by: Rob Herring <robh@kernel.org>
