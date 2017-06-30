From: m18063 <Claudiu.Beznea@microchip.com>
Subject: Re: [PATCH 5/5] ARM: dts: sama5d27_som1_ek: Add sama5d27 SoM1 EK
 support
Date: Fri, 30 Jun 2017 15:28:51 +0300
Message-ID: <f204f169-1939-31cc-05af-8a715b86e082@microchip.com>
References: <1498736674-9233-1-git-send-email-claudiu.beznea@microchip.com>
 <1498736674-9233-6-git-send-email-claudiu.beznea@microchip.com>
 <20170629115931.yki2xbehyicbtx3w@tarshish>
 <20170629121655.37pq7cnabvv4wh7z@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170629121655.37pq7cnabvv4wh7z@piout.net>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Baruch Siach <baruch@tkos.co.il>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, sza@esh.hu, linux-kernel@vger.kernel.org, linux@armlinux.org.uk, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, cristian.birsan@microchip.com
List-Id: devicetree@vger.kernel.org

Hi Baruch, Alexandre

On 29.06.2017 15:16, Alexandre Belloni wrote:
> On 29/06/2017 at 14:59:31 +0300, Baruch Siach wrote:
>> Hi Claudiu,
>>
>> On Thu, Jun 29, 2017 at 02:44:34PM +0300, Claudiu Beznea wrote:
>>> Add specifig DTS files and bindings for sama5d27 SoM1 EK board.
>>
>> Is there any publicly available information on this SoM?
>>
>> One more comment below.
>>
>>> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
>>> Signed-off-by: Cristian Birsan <cristian.birsan@microchip.com>
>>> ---
>>
>> [snip]
>>
>>> +	memory {
>>> +		reg = <0x20000000 0x20000>;
>>
>> Are you sure this SoM has 132KB RAM?
Yes, here is a mistake, the size is 128MB. Sorry for the noise.
>>
>> Since you seem to rely on the bootloader to fill in the right size value, you 
>> can just drop this node and rely on sama5d2.dtsi that provides a stub node.
>>
> 
> Yeah, that is what I would do too.
Ok, I will do it so in v2.

Thank you,
Claudiu
> 
> 
