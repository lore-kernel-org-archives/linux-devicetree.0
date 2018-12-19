From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: net: dsa: ksz9477: add sample of
 switch bindings managed in i2c mode
Date: Wed, 19 Dec 2018 10:26:43 -0800
Message-ID: <538b1829-422a-bf15-b024-e0bf933c930a@gmail.com>
References: <20181217204423.14271-1-sergio.paracuellos@gmail.com>
 <20181218151044.GA26992@bogus>
 <CAMhs-H9VAae3STnYw72M9hma=rhkzUHU_9fNNFEdS0YPqrTbdw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <CAMhs-H9VAae3STnYw72M9hma=rhkzUHU_9fNNFEdS0YPqrTbdw@mail.gmail.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>, Rob Herring <robh@kernel.org>
Cc: Woojung.Huh@microchip.com, UNGLinuxDriver@microchip.com, Andrew Lunn <andrew@lunn.ch>, vivien.didelot@savoirfairelinux.com, driverdev-devel@linuxdriverproject.org, davem@davemloft.net, netdev@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 12/18/18 10:23 PM, Sergio Paracuellos wrote:
> Hi Rob,
> 
> On Tue, Dec 18, 2018 at 4:10 PM Rob Herring <robh@kernel.org> wrote:
>>
>> On Mon, Dec 17, 2018 at 09:44:23PM +0100, Sergio Paracuellos wrote:
>>> Add device-tree binding example of the ksz9477 switch managed in i2c mode.
>>>
>>> Cc: devicetree@vger.kernel.org
>>> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
>>> ---
>>> Changes v3:
>>>     - No changes. Just resent patches together.
>>>
>>> Changes v2:
>>>     - Use generic name for label of the switch and make sure reg and @X
>>>       have the same value.
>>>
>>>  .../devicetree/bindings/net/dsa/ksz.txt       | 50 +++++++++++++++++++
>>>  1 file changed, 50 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/dsa/ksz.txt b/Documentation/devicetree/bindings/net/dsa/ksz.txt
>>> index 0f407fb371ce..d3c4b9d4f416 100644
>>> --- a/Documentation/devicetree/bindings/net/dsa/ksz.txt
>>> +++ b/Documentation/devicetree/bindings/net/dsa/ksz.txt
>>> @@ -74,3 +74,53 @@ Ethernet switch connected via SPI to the host, CPU port wired to eth0:
>>>                                                               };
>>>                                               };
>>>                               };
>>> +
>>> +Ethernet switch connected via I2C to the host, CPU port wired to eth0:
>>> +
>>> +                             eth0: ethernet@10001000 {
>>
>> Why do we have all this indentation? Please remove. And use tab chars,
>> not spaces.
> 
> The original file format is using all of this indentation. So I think
> we would need a patch to change de format of the original file and
> another with this new changes properly formatted.

The original formatting should be fixed, but your changes should adopt
the correct style from the first time they are submitted. Do you mind
resubmitting with only one tab? We can fix the original examples as a
follow-up patch.

Thanks!
-- 
Florian
