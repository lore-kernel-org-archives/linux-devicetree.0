From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH 0/2] mtd: spi-nor: add stm32 qspi driver
Date: Thu, 6 Apr 2017 22:07:07 +0200
Message-ID: <78773671-41f0-3c48-2ecd-64597cbf347d@wedev4u.fr>
References: <1490619296-8168-1-git-send-email-ludovic.Barre@st.com>
 <5224f3cd-a128-9e72-c0c8-62a137ceeb79@wedev4u.fr>
 <d1c2f0a9-302d-ea7c-5d1b-ad32b9950ed4@st.com>
 <e04fa293-63d4-7a7e-a998-37aab31167e5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
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
To: Marek Vasut <marek.vasut@gmail.com>, Ludovic BARRE <ludovic.barre@st.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

Hi all,

Le 30/03/2017 =E0 12:15, Marek Vasut a =E9crit :
> On 03/30/2017 09:31 AM, Ludovic BARRE wrote:
>> hi Cyrille
>>
>> I see your patch series
>>
>> [PATCH v5 0/6] mtd: spi-nor: parse SFDP tables to setup (Q)SPI memories
>>
>> No problem, I rebase my V2 onto your patch
> =

> I still didn't review that, so it might take a bit until it hits
> mainline. I think the stm32 stuff looks pretty OK, so we can take that
> before the SFDP stuff, no?
> =


About the SFDP patches they are still RFC so yes, they can wait, no
problem with that. Anyway I was working on them this afternoon so they
are not finalized yet.

However the first 3 patches of the series, especially patch
"mtd: spi-nor: introduce more SPI protocols and the Dual Transfer Mode",
are needed as a base to fix other long time pending issues.

Those patches are available from both the github/spi-nor and linux-next
tree. So I think Ludovic can rebase his patches, test them then send v3
to the linux-mtd mailing list with the relevant ChangeLog in the cover
letter.

For your information:
2016-06-20 https://patchwork.ozlabs.org/patch/638138/
2016-10-04 https://patchwork.ozlabs.org/patch/678162/
2016-10-05 https://patchwork.ozlabs.org/patch/678404/
2016-10-24 https://patchwork.ozlabs.org/patch/685981/
2016-11-21 https://patchwork.ozlabs.org/patch/697268/
2017-01-25 https://patchwork.ozlabs.org/patch/719777/
2017-03-22 https://patchwork.ozlabs.org/patch/742376/


Sorry but I think the patch changing the 3rd argument of spi_nor_scan()
has precedence over newer patches in the queue to be mainlined.

Best regards,

Cyrille


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
