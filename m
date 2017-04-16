From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH v4 2/2] mtd: spi-nor: add driver for STM32 quad spi flash
 controller
Date: Sun, 16 Apr 2017 19:11:58 +0200
Message-ID: <dfa45902-29e6-067c-ada6-59f9a312690f@wedev4u.fr>
References: <1492103757-22375-1-git-send-email-ludovic.Barre@st.com>
 <1492103757-22375-3-git-send-email-ludovic.Barre@st.com>
 <b0238aad-38a1-3b06-ac2e-45f658041661@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <b0238aad-38a1-3b06-ac2e-45f658041661@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Marek Vasut <marek.vasut@gmail.com>, Ludovic Barre <ludovic.Barre@st.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

Hi all,

Le 14/04/2017 =E0 18:15, Marek Vasut a =E9crit :
> On 04/13/2017 07:15 PM, Ludovic Barre wrote:
>> From: Ludovic Barre <ludovic.barre@st.com>
>>
>> The quadspi is a specialized communication interface targeting single,
>> dual or quad SPI Flash memories.
>>
>> It can operate in any of the following modes:
>> -indirect mode: all the operations are performed using the quadspi
>>  registers
>> -read memory-mapped mode: the external Flash memory is mapped to the
>>  microcontroller address space and is seen by the system as if it was
>>  an internal memory
>>
>> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> =

> Reviewed-by: Marek Vasut <marek.vasut@gmail.com>
> =

Applied to github/spi-nor

About patch 1, I wait for Rob's acknowledgement before merging it into
the next branch of github/spi-nor but I'd rather take patch 2 now since
it has been reviewed by Marek and integration issues would be detected
sooner with linux-next so we would have more time to adapt this patch,
if needed.
I've already compile this patch inside the next branch of github/spi-nor
and no warning was risen so I think there should be any issue.

Hence if no integration issue is detected, I'll try to add it into the
next spi-nor PR for 4.12.

Best regards,

Cyrille

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
