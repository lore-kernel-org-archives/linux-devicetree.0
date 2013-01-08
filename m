From: Tony Camuso <tcamuso-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ipmi: replace call to try_smi_init() with call to add_smi()
Date: Tue, 08 Jan 2013 15:12:31 -0500
Message-ID: <50EC7DAF.8030606@redhat.com>
References: <1355424008-20491-1-git-send-email-tcamuso@redhat.com>
 <50CA31BB.2030507@acm.org> <50CB3662.5080100@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50CB3662.5080100-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: minyard-HInyCGIudOg@public.gmane.org
Cc: k-tanaka-JhyGz2TFV9J8UrSeD/g0lQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, openipmi-developer-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Corey Minyard <tcminyard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, myamazak-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Upstream commit 9e368fa0 added function ipmi_pnp_probe(), which
calls try_smi_init() directly.

try_smi_init() allocates resources for IPMI driver. However
try_smi_init() can be called again, and the allocated resources
can be unexpectedly released when the same IPMI resource
information is found on both ACPI namespace and SMBIOS table.
ipmi_pnp_probe() should call add_smi() instead of try_smi_init()

For reference, see upstream commit ...
2407d77a1a013b88ee3b817f2b934e420e5376f5

Signed-off-by: Tony Camuso <tcamuso-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

---
  drivers/char/ipmi/ipmi_si_intf.c |    2 +-
  1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
index afb89be..20d13c6 100644
--- a/drivers/char/ipmi/ipmi_si_intf.c
+++ b/drivers/char/ipmi/ipmi_si_intf.c
@@ -2223,7 +2223,7 @@ static int __devinit ipmi_pnp_probe(struct pnp_dev *dev,
  	info->dev = &dev->dev;
  	pnp_set_drvdata(dev, info);
  
-	return try_smi_init(info);
+	return add_smi(info);
  
  err_free:
  	kfree(info);
-- 
1.7.1
