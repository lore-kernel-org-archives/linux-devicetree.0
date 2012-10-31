From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH 05/14] fdt: Export fdtdec_find_alias_node()
	function
Date: Wed, 31 Oct 2012 16:50:16 -0700
Message-ID: <CAPnjgZ3J_G=cU+eo5fBuGUuNHL6=uX2ehMgHeLP0f7__5zSdSA@mail.gmail.com>
References: <1351218671-15228-1-git-send-email-sjg@chromium.org>
	<1351218671-15228-6-git-send-email-sjg@chromium.org>
	<20121026042433.GL7222@truffula.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <20121026042433.GL7222@truffula.fritz.box>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Tom Rini <trini@ti.com>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

Hi David,

On Thu, Oct 25, 2012 at 9:24 PM, David Gibson
<david@gibson.dropbear.id.au> wrote:
> On Thu, Oct 25, 2012 at 07:31:02PM -0700, Simon Glass wrote:
>> This function is useful outside fdtdec, so export it.
>
> Hrm.  fdt_path_offset() in libfdt itself will already look up aliases
> if given a path that doesn't start with '/'.  So it's not clear why
> you need this function at all.

Ahh, well I won't be needing that patch, then. I will submit one to
remove this function. Thank you.

Regards,
Simon

>
> --
> David Gibson                    | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au  | minimalist, thank you.  NOT _the_ _other_
>                                 | _way_ _around_!
> http://www.ozlabs.org/~dgibson
