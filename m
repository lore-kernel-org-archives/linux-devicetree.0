From: Albert ARIBAUD <albert.u.boot@aribaud.net>
Subject: Re: [PATCH v4 04/20] arm: fdt: Ensure that an embedded fdt
	is word-aligned
Date: Sat, 18 Feb 2012 12:51:02 +0100
Message-ID: <4F3F90A6.3070002@aribaud.net>
References: <1326342789-5781-1-git-send-email-sjg@chromium.org>
	<1326342789-5781-5-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1326342789-5781-5-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Simon Glass <sjg@chromium.org>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Tom Warren <twarren@nvidia.com>, Jerry Van Baren <vanbaren@cideas.com>
List-Id: devicetree@vger.kernel.org

Hi Simon,

Le 12/01/2012 05:32, Simon Glass a =E9crit :
> By putting the fdt blob into a distinctive area we can ensure that it app=
ears
> at the start of the data section and is word-aligned.
>
> Note: It does not seem to be possible to get objcopy to honour its
> --section-alignment flag, which would otherwise provide an easier fix
> for this problem.

Stop me if I am wrong, but objcopy obviously works with output sections =

of its input file, not with input ones that this file was linked from, =

and so it cannot act upon alignment of data input sections, right? And =

as, before your patch, there is no designated output section for DTS =

data, it ends up (possibly mis-aligned) in the .data output section =

(which is globally aligned however), so there is no chance anyway that =

objcopy can re-align DTS data if they were mis-aligned.

So I must be missing something. Can you clarify the scenario that gets =

fixed here?

Not that I am against the patch, mind you, quite the opposite. I am just =

wondering about the pros and cons of having a separated (and aligned) =

DTS data *output* section and placing that section after .code and .data =

rather than between them.

Amicalement,
-- =

Albert.
