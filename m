From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 1/3] ARM: dts: Bindings for Altera Quadspi Controller
 Version 2
Date: Tue, 27 Jun 2017 17:01:20 +0200
Message-ID: <0ca53c35-732c-a122-8191-6d102e824d52@gmail.com>
References: <1498493619-4633-1-git-send-email-matthew.gerlach@linux.intel.com>
 <1498493619-4633-2-git-send-email-matthew.gerlach@linux.intel.com>
 <0bfc282d-2aec-8f36-1528-312f7ded8d9c@gmail.com>
 <alpine.DEB.2.20.1706270722440.8058@mgerlach-VirtualBox>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <alpine.DEB.2.20.1706270722440.8058@mgerlach-VirtualBox>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: matthew.gerlach@linux.intel.com
Cc: vndao@altera.com, boris.brezillon@free-electrons.com, mchehab@kernel.org, devicetree@vger.kernel.org, richard@nod.at, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, robh+dt@kernel.org, linux-mtd@lists.infradead.org, cyrille.pitchen@wedev4u.fr, mark.rutland@arm.com, computersforpeace@gmail.com, dwmw2@infradead.org, davem@davemloft.net
List-Id: devicetree@vger.kernel.org

On 06/27/2017 04:32 PM, matthew.gerlach@linux.intel.com wrote:
> 
> 
> On Tue, 27 Jun 2017, Marek Vasut wrote:
> 
> Hi Marek,
> 
> Thanks for the feedback.  See my comments below.
> 
> Matthew Gerlach
> 
>> On 06/26/2017 06:13 PM, matthew.gerlach@linux.intel.com wrote:
>>> From: Matthew Gerlach <matthew.gerlach@linux.intel.com>
>>>
>>> Device Tree bindings for Version 2 of the Altera Quadspi Controller
>>> that can be optionally paired with a windowed bridge.
>>>
>>> Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
>>> ---
>>>  .../devicetree/bindings/mtd/altera-quadspi-v2.txt  | 37
>>> ++++++++++++++++++++++
>>>  1 file changed, 37 insertions(+)
>>>  create mode 100644
>>> Documentation/devicetree/bindings/mtd/altera-quadspi-v2.txt
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/mtd/altera-quadspi-v2.txt
>>> b/Documentation/devicetree/bindings/mtd/altera-quadspi-v2.txt
>>> new file mode 100644
>>> index 0000000..8ba63d7
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/mtd/altera-quadspi-v2.txt
>>> @@ -0,0 +1,37 @@
>>> +* Altera Quad SPI Controller Version 2
>>> +
>>> +Required properties:
>>> +- compatible : Should be "altr,quadspi-v2".
>>> +- reg : Contains at least two entries, and possibly three entries,
>>> each of
>>> +    which is a tuple consisting of a physical address and length.
>>> +- reg-names : Should contain the names "avl_csr" and "avl_mem"
>>> corresponding
>>> +          to the control and status registers and qspi memory,
>>> respectively.
>>> +
>>> +
>>> +The Altera Quad SPI Controller Version 2 can be paired with a
>>> windowed bridge
>>> +in order to reduce the footprint of the memory interface.  When a
>>> windowed
>>> +bridge is used, reads and writes of data must be 32 bits wide.
>>> +
>>> +Optional properties:
>>> +- reg-names : Should contain the name "avl_window", if the windowed
>>> bridge
>>> +          is used.  This name corresponds to the register space that
>>> +          controls the window.
>>> +- window-size : The size of the window which must be an even power
>>> of 2.
>>> +- read-bit-reverse : A boolean indicating the data read from the
>>> flash should
>>> +             be bit reversed on a byte by byte basis before being
>>> +             delivered to the MTD layer.
>>> +- write-bit-reverse : A boolean indicating the data written to the
>>> flash should
>>> +              be bit reversed on a byte by byte basis.
>>
>> Is there ever a usecase where you need to set just one of these props ?
>> Also, they're altera specific, so altr, prefix should be added.
> 
> In general, I think if bit reversal is required, it would be required in
> both directions.  However, anything is possible when using FPGAs.  So
> I thought separate booleans would be future proofing the bindings.

Maybe we should drop this whole thing and add it when this is actually
required.

Are there any users of this in the wild currently ?

What is the purpose of doing this per-byte bit reverse instead of
storing th bits in the original order ?

> Thinking about this binding more, I wonder if the binding name(s)
> should be (read|write)-bit8-reverse to indicate reversings the bits
> in a byte as opposed to reversing the bits in a 32 bit word?
>
> I don't think bit reversal is specific to Altera/Intel components. I see
> a nand driver performing bit reversal, and I think I've recently seen
> other FPGA based drivers requiring bit reversal.

$ git grep bit.reverse Documentation/devicetree/ | wc -l
0

So we don't have such a generic binding . It's up to Rob (I guess) to
decide whether this is SoC specific and should've altr, prefix or not.
IMO it is.

-- 
Best regards,
Marek Vasut

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
