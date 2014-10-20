From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCHv2 2/2] ARM: dts: socfpga: Add a 3.3V fixed regulator node
Date: Mon, 20 Oct 2014 16:02:41 -0500
Message-ID: <54457871.404@opensource.altera.com>
References: <1413819079-17120-1-git-send-email-dinguyen@opensource.altera.com>	<1413819079-17120-3-git-send-email-dinguyen@opensource.altera.com> <CAD=FV=XzQ0JHpNsu+fyuRGi6NHeVxwNdxuGTPny3+dbTDYCo5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=XzQ0JHpNsu+fyuRGi6NHeVxwNdxuGTPny3+dbTDYCo5g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/20/2014 10:51 AM, Doug Anderson wrote:
> Dinh,
> 
> On Mon, Oct 20, 2014 at 8:31 AM,  <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org> wrote:
>> +++ b/arch/arm/boot/dts/socfpga_arria5_socdk.dts
>> @@ -37,6 +37,15 @@
>>                 */
>>                 ethernet0 = &gmac1;
>>         };
>> +
>> +       regulator_3_3v: regulator {
> 
> I think it's better to give this a real node name.  The
> "regulator_3_3v" will get dropped when you compile this into a binary
> format (for shipping), so you're creating a node that's just called
> "regulator".  If you had more than one fixed regulator like this it
> just won't work.
> 
> I haven't seen any official guidelines, but I tend to use "regulator"
> as a suffix and then put the schematic name.  Like:
> 
>   3_3v_regulator: 3-3-v-regulator
> 
>

Not sure if there's a limit on a node cannot start with numeric value?
But if I change it to your suggestion, the DTC does not compile:

Error: arch/arm/boot/dts/socfpga_cyclone5_socdk.dts:41.16-17 syntax error
FATAL ERROR: Unable to parse input tree


But regulator_3_3v: 3-3-v-regulator   will work fine.

Dinh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
