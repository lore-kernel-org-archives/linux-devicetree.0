From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH 2/3] mtd: davinci-nand: add dts property for
 NAND_NO_SUBPAGE_WRITE option
Date: Thu, 20 Mar 2014 14:02:39 -0400
Message-ID: <532B2D3F.6050004@ti.com>
References: <1395335184-4745-1-git-send-email-ivan.khoronzhuk@ti.com>
 <1395335184-4745-3-git-send-email-ivan.khoronzhuk@ti.com>
 <532B2183.2080309@ti.com> <20140320172912.GW31517@norris-Latitude-E6410>
 <532B2766.6090506@ti.com> <D69011BE-C37F-4085-B992-45F6F32AF1D0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <D69011BE-C37F-4085-B992-45F6F32AF1D0@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Warner Losh <imp@bsdimp.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, grygorii.strashko@ti.com, Russell King - ARM Linux <linux@arm.linux.org.uk>, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-mtd@lists.infradead.org, Murali Karicheri <m-karicheri2@ti.com>, rob@landley.net, galak@codeaurora.org, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thursday 20 March 2014 01:44 PM, Warner Losh wrote:
> 
> On Mar 20, 2014, at 11:37 AM, Santosh Shilimkar <santosh.shilimkar@ti.com> wrote:
> 
>>
>>
>> On Thursday 20 March 2014 01:29 PM, Brian Norris wrote:
>>> On Thu, Mar 20, 2014 at 01:12:35PM -0400, Santosh Shilimkar wrote:
>>>> Boris,
>>>
>>> Who's Boris? And why should Boris be taking this patch? It's an MTD
>>> patch.
>>>
>> I got your name completely wrong. Sorry....
>>
>>>> On Thursday 20 March 2014 01:06 PM, Ivan Khoronzhuk wrote:
>>>>> From: Murali Karicheri <m-karicheri2@ti.com>
>>>>>
>>>>> After testing NAND flash with ubifs for k2hk-emv board were committed
>>>>> that flash doesn't support subpage writing, so we can fix it by
>>>>> adding a property to disable subpage write.
>>>
>>> What flash? We try to autodetect NAND as much as possible. Perhaps we
>>> should be adding infrastructure support instead of hacking it with a DT
>>> property.
>>>
>> We can't auto detect it and thats why the DT approach was taken. We
>> will double check that.
> 
> I though sub page writing was one of the fields in the onfi and/or jedec(toggle) meta data structures. Have you looked there?
> 
Am not sure if I follow you. The limitation is from the TI NAND controller(AEMIF) and
not the NAND memory. 

regards,
Santosh
