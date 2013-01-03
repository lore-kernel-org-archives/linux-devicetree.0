From: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v5 0/7] leds: leds-pwm: Device tree support
Date: Thu, 3 Jan 2013 09:00:53 +0100
Message-ID: <50E53AB5.8030908@ti.com>
References: <1356083041-29179-1-git-send-email-peter.ujfalusi@ti.com>
 <CAK5ve-L=L2qp1A01Kui9RAMn9mZxL7P-c0sZ1bDveLoKkK0Fzg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAK5ve-L=L2qp1A01Kui9RAMn9mZxL7P-c0sZ1bDveLoKkK0Fzg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Bryan,

On 01/03/2013 03:10 AM, Bryan Wu wrote:
> Hi Peter,
> =

> I merged this patchset into my for-next branch already.

Thank you!

> =

> Thanks for pushing this.

It was my pleasure!
Thanks for the help on this.

P=E9ter

> -Bryan
> =

> On Fri, Dec 21, 2012 at 1:43 AM, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org> w=
rote:
>> Hello,
>>
>> Changes since v4:
>> - Commit message for patch #7 (DT binding for the leds-pwm driver) has b=
een
>>   updated
>>
>> Changes since v3:
>> Addressed comments from Thierry Redding:
>> - DT binding documentation for leds-pwm updated
>> - of_pwm_request() renamed as of_pwm_get()
>> - introduction of devm_of_pwm_get()
>> - Commit message updates
>> - Other comments has been also addressed
>> - Acked-by from Grant is not added to the patches since they were modifi=
ed since
>>   v3
>>
>> Changes since v2:
>> - rebased on top of linux-next
>> - DT bindings now alligned with Grant's request
>> - exporting of_pwm_request() from PWM core to allow clean DT bindings
>> - DT binding documentation changed to reflect the changes
>>
>> Changes since v1:
>> - As suggested by Bryan Wu: the legacy pwm_request() has been removed fr=
om
>>   patch 1
>> - Device tree bindings added for leds-pwm driver.
>>
>> When we boot with Device tree we handle one LED per device to be more al=
igned
>> with PWM core's DT implementation.
>> An example of the DT usage is provided in the new DT binding documentati=
on for
>> leds-pwm.
>>
>> Tested on OMAP4 Blaze (SDP), BeagleBoard with legacy and DT boot. On Zoo=
m2 with
>> legacy boot.
>>
>> Regards,
>> Peter
>> ---
>> Peter Ujfalusi (7):
>>   leds: leds-pwm: Convert to use devm_get_pwm
>>   leds: leds-pwm: Preparing the driver for device tree support
>>   pwm: Correct parameter name in header for *pwm_get() functions
>>   pwm: core: Rename of_pwm_request() to of_pwm_get() and export it
>>   pwm: Add devm_of_pwm_get() as exported API for users
>>   leds: leds-pwm: Simplify cleanup code
>>   leds: leds-pwm: Add device tree bindings
>>
>>  .../devicetree/bindings/leds/leds-pwm.txt          |  48 +++++++
>>  drivers/leds/leds-pwm.c                            | 152 ++++++++++++++=
+------
>>  drivers/pwm/core.c                                 |  38 +++++-
>>  include/linux/leds_pwm.h                           |   2 +-
>>  include/linux/pwm.h                                |  20 ++-
>>  5 files changed, 212 insertions(+), 48 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.txt
>>
>> --
>> 1.8.0.2
>>
