From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v4 3/8] Documentation: devicetree: rockchip: Document
 GeekBox
Date: Tue, 29 Mar 2016 22:45:18 +0200
Message-ID: <56FAE95E.6060900@suse.de>
References: <1458136727-32075-1-git-send-email-afaerber@suse.de>
 <1458136727-32075-4-git-send-email-afaerber@suse.de>
 <31070685.TnxqGeNupO@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <31070685.TnxqGeNupO@diego>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Am 29.03.2016 um 22:13 schrieb Heiko St=C3=BCbner:
> Am Mittwoch, 16. M=C3=A4rz 2016, 14:58:41 schrieb Andreas F=C3=A4rber=
:
>> Use "geekbuying,geekbox" compatible string.
>>
>> Acked-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
>=20
> I've folded this patch into the geekbox dts patch, carrying Rob's Ack=
 for the=20
> binding over.

Either you just made a mistake in my name or
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/D=
ocumentation/devicetree/bindings/submitting-patches.txt
needs an update. It clearly says:

"1) The Documentation/ portion of the patch should be a separate patch.=
"

That's why I always do it this way.

Regards,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton; HRB 21284 (AG=
 N=C3=BCrnberg)
