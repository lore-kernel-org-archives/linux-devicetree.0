From: Alexey Roslyakov <alexey.roslyakov@gmail.com>
Subject: Re: [PATCH net-next v2 1/2] brcmfmac: add new dt entries for SG SDIO settings
Date: Mon, 19 Mar 2018 23:27:04 +0700
Message-ID: <CALFoz4a=zoLrLvrR7wpeg5JAeL3KrTf24AGEuOcLWBrSmp+xWA@mail.gmail.com>
References: <20180319014032.9394-1-alexey.roslyakov@gmail.com>
 <20180319014032.9394-2-alexey.roslyakov@gmail.com> <877eq8yqym.fsf@kamboji.qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <877eq8yqym.fsf@kamboji.qca.qualcomm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Andrew Lunn <andrew@lunn.ch>, robh+dt@kernel.org, mark.rutland@arm.com, Arend van Spriel <arend.vanspriel@broadcom.com>, franky.lin@broadcom.com, hante.meuleman@broadcom.com, chi-hsien.lin@cypress.com, wright.feng@cypress.com, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, brcm80211-dev-list@cypress.com
List-Id: devicetree@vger.kernel.org

Hi, Kalle,
good remark, I'll try to make it clear in next version.

Thank you.


On 19 March 2018 at 23:23, Kalle Valo <kvalo@codeaurora.org> wrote:
> Alexey Roslyakov <alexey.roslyakov@gmail.com> writes:
>
>> There are 3 fields in SDIO settings (quirks) to workaround some of the
>> SG SDIO host particularities, i.e higher align requirements for SG
>> items. All coding is done the long time ago, but there is no way to
>> change the driver behavior without patching the kernel. Add missing
>> devicetree entries.
>>
>> Signed-off-by: Alexey Roslyakov <alexey.roslyakov@gmail.com>
>
> The commit log is not clear for me, what does "all coding is done long
> time ago" exactly mean? What code and where?
>
>>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c | 12 +++++++++---
>>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> Why net-next? To me it looks like this should go to
> wireless-drivers-next.
>
> --
> Kalle Valo



-- 
With best regards,
  Alexey Roslyakov
Email: alexey.roslyakov@gmail.com
