From: =?windows-1252?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [RFC 4/7] soc: qcom: Add Shared Memory Manager driver
Date: Sun, 26 Oct 2014 16:04:24 +0100
Message-ID: <544D0D78.1030204@suse.de>
References: <1412037291-16880-1-git-send-email-bjorn.andersson@sonymobile.com> <1412037291-16880-5-git-send-email-bjorn.andersson@sonymobile.com> <5435AD8E.2000109@codeaurora.org> <20141017145158.GB28882@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20141017145158.GB28882@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Jeffrey Hugo <jhugo@codeaurora.org>, Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Suman Anna <s-anna@ti.com>
List-Id: devicetree@vger.kernel.org

Hi,

Am 17.10.2014 um 16:51 schrieb Bjorn Andersson:
> On Wed 08 Oct 14:33 PDT 2014, Jeffrey Hugo wrote:
>> On 9/29/2014 6:34 PM, Bjorn Andersson wrote:
>>> diff --git a/include/linux/soc/qcom/qcom_smem.h b/include/linux/soc=
/qcom/qcom_smem.h
>>
>> include/soc/ already exists, why add include/linux/soc?
>>
>=20
> I have to admit I don't really understand why the tegra stuff is in
> include/soc/, will have to do some more investigation.

AFAIR soc/ was mach-* stuff that is shared between arm and arm64.

Cheers,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
