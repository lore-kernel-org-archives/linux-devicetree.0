From: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work-JGs/UdohzUI@public.gmane.org>
Subject: =?UTF-8?B?UmVbMl06IFtQQVRDSCBWMiA0LzZdIEFSTTogZHRzOiBpbXg2cTogYWRkIHBp?=
 =?UTF-8?B?bmN0cmwgZm9yIFdFSU0gTk9S?=
Date: Thu, 23 May 2013 13:55:06 +0400
Message-ID: <1369302906.444557883@f310.mail.ru>
References: <1369296978-7669-1-git-send-email-b32955@freescale.com>
 <1369301996.738631947@f310.mail.ru>
 <519DE6D0.2040909@freescale.com>
Reply-To: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work-JGs/UdohzUI@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <519DE6D0.2040909-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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
To: =?UTF-8?B?SHVhbmcgU2hpamll?= <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

> > How we should define CS1 pin in your example for second device?
> 
> But in the imx6q{dl}-sabreauto boards, we only have the NOR connected to 
> WEIM.
> I do not need to worry about the second device.

OK, but you add "weim-NOR" to the arch/arm/boot/dts/imx6q.dtsi, not
in imx6qdl-sabreauto.dtsi, so you mean that this definition is generic.
Should it be moved to imx6qdl-sabreauto.dtsi then?

---
