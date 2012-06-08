From: Subodh Nijsure <snijsure-4jo+YWezP1RWk0Htik3J/w@public.gmane.org>
Subject: Booting MX28-EVK without bootloader support
Date: Fri, 8 Jun 2012 00:53:46 -0700
Message-ID: <4FD1AF8A.8070406@grid-net.com>
References: <1339113456-27089-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1080376425554684544=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1339113456-27089-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============1080376425554684544==
Content-Type: multipart/alternative;
	boundary="------------020509090501010603090303"

--------------020509090501010603090303
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


I am using git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git 
for-next branch to get familiar with device tree.

I am following procedure described in  thread --

http://lists.ozlabs.org/pipermail/devicetree-discuss/2012-April/014600.html

Turn on CONFIG_ARM_APPENDED_DTB,  CONFIG_ARM_ARAG_DTB, then appending 
imx28-evk.dtb and constructing zImage_dtb

However this image never initializes network interfaces, I can't mount 
nfs as rootfs. Is the appended DTB supposed to work from above 
referenced git repo & branch?

Pardon me, if this is too basic DT question on device tree 
initialization sequence. During initialization I see that - 
mxs_machine_init gets called which invokes of_platform_populate(). 
However I don't see the mx28evk_init() function never gets called, 
should that function be getting called?

If mx28evk_init shouldn't be called how is MXS ethernet driver supposed 
to get registered when using device tree?

-Subodh

--------------020509090501010603090303
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    I am using
    git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git
    for-next branch to get familiar with device tree. <br>
    <br>
    I am following procedure described in&nbsp; thread --<br>
    <br>
    <a
href="http://lists.ozlabs.org/pipermail/devicetree-discuss/2012-April/014600.html">http://lists.ozlabs.org/pipermail/devicetree-discuss/2012-April/014600.html</a><br>
    <br>
    Turn on CONFIG_ARM_APPENDED_DTB,&nbsp; CONFIG_ARM_ARAG_DTB, then
    appending imx28-evk.dtb and constructing zImage_dtb<br>
    &nbsp;<br>
    However this image never initializes network interfaces, I can't
    mount nfs as rootfs. Is the appended DTB supposed to work from above
    referenced git repo &amp; branch?<br>
    <br>
    Pardon me, if this is too basic DT question on device tree
    initialization sequence. During initialization I see that -
    mxs_machine_init gets called which invokes of_platform_populate().
    However I don't see the mx28evk_init() function never gets called,
    should that function be getting called? <br>
    <br>
    If mx28evk_init shouldn't be called how is MXS ethernet driver
    supposed to get registered when using device tree?<br>
    <span style="color: rgb(0, 0, 0); font-family: sans-serif;
      font-size: 13px; font-style: normal; font-variant: normal;
      font-weight: normal; letter-spacing: normal; line-height: 19px;
      orphans: 2; text-align: -webkit-auto; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-size-adjust: auto;
      -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
      255); display: inline !important; float: none; "><span
        class="Apple-converted-space"></span></span><br>
    -Subodh<br>
  </body>
</html>

--------------020509090501010603090303--

--===============1080376425554684544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1080376425554684544==--
