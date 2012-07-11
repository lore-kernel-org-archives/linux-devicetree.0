From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v2 03/19] fdt: Add function to look up a
 phandle's register address
Date: Wed, 11 Jul 2012 07:10:39 +0200
Message-ID: <CAPnjgZ2NXWWg9CsCQRMWaxQC5NcYcc7yrMnNiv2Mpq1_wib7Ow@mail.gmail.com>
References: <1339604395-6621-1-git-send-email-sjg@chromium.org>
	<1339604395-6621-4-git-send-email-sjg@chromium.org>
	<4FDA70F5.1030303@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0866686533=="
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4FDA70F5.1030303@wwwdotorg.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

--===============0866686533==
Content-Type: multipart/alternative; boundary=bcaec550b36c3756bb04c486de64

--bcaec550b36c3756bb04c486de64
Content-Type: text/plain; charset=ISO-8859-1

Hi Stephen,

On Fri, Jun 15, 2012 at 1:17 AM, Stephen Warren <swarren@wwwdotorg.org>wrote:

> On 06/13/2012 10:19 AM, Simon Glass wrote:
> > This is a commonly-used requirement, so add a function to support it
> > easily.
>
> Uggh. Why would this ever be needed; shouldn't the driver for the node
> referenced by the phandle fully control its own registers; why would any
> other driver randomly trample on them?
>

You are making assumptions. This is used for the pwm and only accessed by
the pwm driver.

It's basically to allow a simple and efficient way of getting access to a
peripheral. Since the new binding you pointed me to uses a single pwm with
multiple channels, this doesn't offer any benefit so I will punt it.

Regards,
Simon

--bcaec550b36c3756bb04c486de64--

--===============0866686533==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
U-Boot mailing list
U-Boot@lists.denx.de
http://lists.denx.de/mailman/listinfo/u-boot

--===============0866686533==--
