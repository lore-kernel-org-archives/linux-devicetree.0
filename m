From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v3] DT: net: document Ethernet bindings in one place
Date: Fri, 31 Jan 2014 23:54:14 +0300
Message-ID: <52EC0D76.9020701@cogentembedded.com>
References: <201401280316.28735.sergei.shtylyov@cogentembedded.com> <CAMuHMdV6QNGAh8s40z766N6HMboUW_eO85Gs7p0JBAuZ6vW1Nw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdV6QNGAh8s40z766N6HMboUW_eO85Gs7p0JBAuZ6vW1Nw@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, galak@codeaurora.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Landley <rob@landley.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Max Filippov <jcmvbkbc@gmail.com>
List-Id: devicetree@vger.kernel.org

Hello.

On 01/28/2014 11:26 AM, Geert Uytterhoeven wrote:

>> --- /dev/null
>> +++ net-next/Documentation/devicetree/bindings/net/ethernet.txt
>> @@ -0,0 +1,23 @@
>> +The following properties are common to the Ethernet controllers:
>> +
>> +- local-mac-address: array of 6 bytes, specifies the MAC address that was
>> +  assigned to the network device;
>> +- mac-address: array of 6 bytes, specifies the MAC address that was last used by
>> +  the boot program; should be used in cases where the MAC address assigned to
>> +  the device by the boot program is different from the "local-mac-address"
>> +  property;
>> +- max-speed: number, specifies maximum speed in Mbit/s supported by the device;
>> +- max-frame-size: number, maximum transfer unit (IEEE defined MTU), rather than
>> +  the maximum frame size (there's contradiction in ePAPR).
>> +- phy-mode: string, operation mode of the PHY interface; supported values are
>> +  "mii", "gmii", "sgmii", "tbi", "rev-mii", "rmii", "rgmii", "rgmii-id",
>> +  "rgmii-rxid", "rgmii-txid", "rtbi", "smii", "xgmii"; not recommended for new
>> +  bindings;
>> +- phy-connection-type: the same as "phy-mode" property but described in ePAPR;
>> +- phy-handle: phandle, specifies a reference to a node representing a PHY
>> +  device; this property is described in ePAPR and so preferred;
>> +- phy: the same as "phy-handle" property, not recommended for new bindings.

> I think it would be more clear to move the not recommended ones to a new
> paragraph, with a preamble stating they're not recommended for new bindings.

    In fact, at the moment, only "phy" prop can be named as not recommended, 
the "phy-mode" should better be described as de facto standard as it's 
mentioned even in ePAPR 1.1 examples (and of_get_phy_mode() patch to recognize 
"phy-connection-type" as well as "phy-mode" prop probably got lost somewhere). 
Thus I'm not sure it's worth creating separate paragraph for the sake of one 
prop is worth it now. Although there's also "phy-device" which I didn't 
mention here (and IIRC there's some more non-standard ways to address the PHY)...

WBR, Sergei

