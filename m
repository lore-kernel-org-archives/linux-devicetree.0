From: Ludovic BARRE <ludovic.barre@st.com>
Subject: Re: [PATCH 0/2] mtd: spi-nor: add stm32 qspi driver
Date: Wed, 5 Apr 2017 18:20:23 +0200
Message-ID: <19157469-9fcd-27aa-f870-21e46f7ffcab@st.com>
References: <1490619296-8168-1-git-send-email-ludovic.Barre@st.com>
 <5224f3cd-a128-9e72-c0c8-62a137ceeb79@wedev4u.fr>
 <d1c2f0a9-302d-ea7c-5d1b-ad32b9950ed4@st.com>
 <e04fa293-63d4-7a7e-a998-37aab31167e5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <e04fa293-63d4-7a7e-a998-37aab31167e5@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

hi Cyrille, Marek

I've re-based and tested my patchset onto

"mtd: spi-nor: introduce more SPI protocols and the Dual Transfer Mode"

So I can deliver my patchset before or after Cyrille patchset

How do you wish process? what version do you want for the v3?


BR

Ludo

On 03/30/2017 12:15 PM, Marek Vasut wrote:
> On 03/30/2017 09:31 AM, Ludovic BARRE wrote:
>> hi Cyrille
>>
>> I see your patch series
>>
>> [PATCH v5 0/6] mtd: spi-nor: parse SFDP tables to setup (Q)SPI memories
>>
>> No problem, I rebase my V2 onto your patch
> I still didn't review that, so it might take a bit until it hits
> mainline. I think the stm32 stuff looks pretty OK, so we can take that
> before the SFDP stuff, no?
>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
