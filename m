From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] firmware: dt: document lpc1850 boot ROM bindings
Date: Fri, 23 Sep 2016 22:01:47 +0200
Message-ID: <CAGhQ9VwLHiONa5pfpAhKuu78uDwYRjfwJu3i1fhjVz+zaDFojw@mail.gmail.com>
References: <20160913195117.2887-1-manabian@gmail.com> <20160913195117.2887-3-manabian@gmail.com>
 <20160923133949.GA24505@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160923133949.GA24505@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 23 September 2016 at 15:39, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Sep 13, 2016 at 09:51:16PM +0200, Joachim Eastwood wrote:
>> Binding documentation for the NXP LPC boot ROM.
>>
>> Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  .../devicetree/bindings/firmware/nxp,boot-rom.txt   | 21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/firmware/nxp,boot-rom.txt
>>
>> diff --git a/Documentation/devicetree/bindings/firmware/nxp,boot-rom.txt b/Documentation/devicetree/bindings/firmware/nxp,boot-rom.txt
>> new file mode 100644
>> index 0000000..5f3a044
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/firmware/nxp,boot-rom.txt
>> @@ -0,0 +1,21 @@
>> +* NXP LPC boot ROM
>> +
>> +NXP LPC microcontrollers contains a boot ROM used to retrieve part information
>> +and access internal Flash memory and OTP memory. Note that the Flash API is
>> +not available on Flashless devices.
>
> Is this determined at run-time? If not flashless devices should have a
> different compatible string to determine this then.

It is determined at run time by reading a 'CHIP ID' register in CREG
(syscon) that is present on both Flash and Flashless devices.


regards,
Joachim Eastwood
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
