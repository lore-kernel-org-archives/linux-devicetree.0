From: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Re[2]: [PATCH] of: Add more stubs for non-OF builds
Date: Fri, 21 Jun 2013 10:13:52 -0700
Message-ID: <CAK5ve-L7MSc0wjiNK1gPfRFSC5xkZ8BwvqL9MM=eGRd2hc08+g@mail.gmail.com>
References: <1371489882-11143-1-git-send-email-shc_work@mail.ru>
 <20130621002607.F24A63E093E@localhost>
 <CAK5ve-JX1BC-jdpSzBx_en_o4FYjie-1GRL39B18NywUvXAHrg@mail.gmail.com>
 <1371824246.856851759@f137.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1371824246.856851759-pyBXd9eNxi0edp2WBT/QOw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Linux LED Subsystem <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 21, 2013 at 7:17 AM, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org> wrote:
>> On Thu, Jun 20, 2013 at 5:26 PM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> > On Thu, 20 Jun 2013 16:49:54 -0700, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> >> Hi Rob,
>> >>
>> >> Is this patch good for merging?
>> >>
>> >> In Alex's one patch to add device tree supporting for a leds driver,
>> >> we got building errors due to miss definitions of some of_xxx api
>> >> functions.
>> >>
>> >> It looks obviously to me that we need to fix this in device tree core
>> >> instead put #ifdef CONFIG_OF everywhere.
>> >
>> > Actually, the reason those things aren't universally defined is to catch
>> > exactly what it caught. The "leds-mc13783: Add devicetree support" patch
>> > interleaves DT and non-DT parsing which isn't generally a good idea. The
>> > DT parsing code should be shuffled off into a separate function and/or
>> > contained with "if (IS_ENABLED(CONFIG_OF)) {}".
>> >
>>
>> Agree, reasonable! I will remove this patch from my tree firstly.
>>
>> Alex, could you please update your patch with Grant's feedback?
>
> As far I understand you mean only the last part of patch. Where DT support
> is introduced. Is not it?
>

Yes, exactly. I still keep those 2 non-DT related patches in my tree
and just removed that DT supporting patch.

Please update that patch and posted again to linux-leds and DT
maintainers as well.

Thanks,
-Bryan
