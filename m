From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v4 5/5] fsl-diu-fb: Support setting display mode using EDID
Date: Thu, 16 Dec 2010 10:42:21 -0700
Message-ID: <AANLkTimVxKojtWP=X2=5SoZZu0_dHkWxmHxhXj1-jr+U@mail.gmail.com>
References: <1279893639-24333-1-git-send-email-agust@denx.de>
	<1279893639-24333-6-git-send-email-agust@denx.de>
	<AANLkTin-TL5_TKnyHYtZdixosfqpkPNoarSTC+K4tTUb@mail.gmail.com>
	<AANLkTi=NwY_gcBXeKXeGX-qist3tMQ4EWqj3twYGfeWD@mail.gmail.com>
	<4D0A446E.5020600@freescale.com>
	<AANLkTinOf__X0p3_5G90KkYS9PXpB2j0_06MFhFcZzqO@mail.gmail.com>
	<4D0A4C38.3010105@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <4D0A4C38.3010105@freescale.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Timur Tabi <timur@freescale.com>
Cc: linuxppc-dev@ozlabs.org, linux-fbdev@vger.kernel.org, Anatolij Gustschin <agust@denx.de>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 16, 2010 at 10:28 AM, Timur Tabi <timur@freescale.com> wrote:
> Grant Likely wrote:
>> No. =A0It is a static property of the board/machine. =A0It is expected it
>> to be encoded into the board's .dts file.
>
> Ok, but that only makes sense if the monitor is hard-wired to the board i=
tself.
> =A0If a user can attach any monitor he wants, then the EDID data can't be=
 known at
> compile time.
>
> I guess it's no different than using hard-coded memory controller program=
ming
> instead of SPD. =A0You can safely avoid SPD only if the DDR chips are sol=
dered on
> the board.

Correct, if a real EDID i2c channel exists, then an edid property
should *not* be specified in the device tree.

g.
