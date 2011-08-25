From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 0/2] i2c/of: Populate multiplexed i2c busses from the
	device tree.
Date: Wed, 24 Aug 2011 17:25:54 -0700
Message-ID: <1314231956-21115-1-git-send-email-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

We need to populate our I2C devices from the device tree, but some of
our systems have multiplexers which currently break this process.

The basic idea is to have the generic i2c-mux framework propagate the
device_node for the child bus into the corresponding i2c_adapter, and
then call of_i2c_register_devices().  This means that the device tree
bindings for *all* i2c muxes must have some common properties.  I try
to document these in mux.txt.

At this point it is an RFC because the patches are against an old
kernel.  Once we agree on how this should look, I will test them
against a current kernel.

Any feedback on the approach and/or specific bindings is most welcome.

David Daney (2):
  i2c: Add a struct device * parameter to i2c_add_mux_adapter()
  i2c/of: Automatically populate i2c mux busses from device tree data.

 Documentation/devicetree/bindings/i2c/mux.txt |   54 +++++++++++++++++++++++++
 drivers/i2c/i2c-mux.c                         |   44 ++++++++++++++++----
 drivers/i2c/muxes/gpio-i2cmux.c               |    3 +-
 drivers/i2c/muxes/pca9541.c                   |    3 +-
 drivers/i2c/muxes/pca954x.c                   |    2 +-
 include/linux/i2c-mux.h                       |    3 +-
 6 files changed, 96 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/mux.txt

-- 
1.7.2.3
