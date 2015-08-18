From: Graham Moore <grmoore@opensource.altera.com>
Subject: Re: [PATCH V7 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
Date: Tue, 18 Aug 2015 14:03:57 -0500
Message-ID: <55D3819D.1040009@opensource.altera.com>
References: <1439522892-7524-1-git-send-email-marex@denx.de>
 <55D29A0B.20408@st.com> <201508180647.30119.marex@denx.de>
 <0B80CAC4-70B3-4557-8D6E-4CA84AF9CEA2@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <0B80CAC4-70B3-4557-8D6E-4CA84AF9CEA2@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Vikas MANOCHA <vikas.manocha@st.com>
Cc: Marek Vasut <marex@denx.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alan Tull <atull@opensource.altera.com>, Yves Vandervennet <yvanderv@opensource.altera.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Dinh Nguyen <dinguyen@opensource.altera.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

Hi all,

On 08/18/2015 12:48 AM, Vikas MANOCHA wrote:

[...]

>>>> +Required properties:
>>>> +- compatible : Should be "cdns,qspi-nor".
>>>> +- reg : Contains two entries, each of which is a tuple consisting of a
>>>> +    physical address and length.  The first entry is the address and
>>>> +    length of the controller register set.  The second entry is the
>>>> +    address and length of the QSPI Controller data area.
>>>
>>> "Controller data area", i think it means mapped NOR Flash address ?
>>
>> Probably ; Graham ?
>>
>>> If yes, it would be more clear with "Physical base address & size of NOR
>>> Flash".
>>
>> This is the Direct mode thing, correct ? We don't support this, so I think
>> we should drop this bit altogether and keep only one single address in this
>> field.
>
> No it's not.
>

It's the location of the SRAM fifo.  Also direct mode location I think, 
if that were ever used.

The size is determined by a configuration parameter during system 
design.  On Altera Cyclone5 the size is really big compared to SRAM 
fifo.  I don't know why, maybe some hw engineer thought it would be 
better to have a large size in case direct mode was used.

BR,
Graham

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
