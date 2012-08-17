From: Leela Krishna Amudala <leelakrishna.a-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: <Query> Reg: Adding a gpio initialization sequence in dts is
 valid or not
Date: Fri, 17 Aug 2012 16:07:00 +0530
Message-ID: <CAL1wa8d-6qXOXS2+sVZAgnpGw0-x03WKpOhiVhSKZ3JoQZW1fw@mail.gmail.com>
References: <CAL1wa8fjJg33vVM4ZOFuA2ACps55cahoK65MDf4ebAi9B6KUxg@mail.gmail.com>
 <502269EC.2070008@gmail.com> <502287E1.3040508@wwwdotorg.org>
 <50231B55.6070007@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=f46d042fdc1eaedc4104c773be9e
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50231B55.6070007-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
To: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--f46d042fdc1eaedc4104c773be9e
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I think you misinterpreted my question.

Alex,
Your documentation says that power on sequence look like shown below
(step1: enabling regulator, step2: enabling pwm and step3: enabling a
gpio line)

power-on-sequence {
        step0 {
                regulator = "power";
                enable;
        };
        step1 {
                delay = <10000>;
        };
        step2 {
                pwm = "backlight";
                enable;
        };

But I don't bother about enabling regulator and pwm for my panel.

My panel needs a sequence like
1. Pull up a gpio line
2. Maintain some delay
3. Pull down gpio line
4. Maintain some delay and
5. Pull up a gpio line.

Please find the Image shown in the attachment for better understanding.

So, to get this done I used your code and created a node like below
and it worked for me.

backlight {
        compatible = "pwm-backlight";
        brightness-levels = <0 16 32 48 64 80 96 112 128 144 160 176
192 208 224 240 255>;
        default-brightness-level = <12>;

        enable-gpio1 = <&gpx1 5 1 0 0>;
        enable-gpio2 = <&gpx3 0 0 0 0>;

        power-on-sequence {
                gpio@2 {
                        id = "enable-gpio1";
                        enable;
                        post-delay = <20>;
                };
                gpio@3 {
                         id = "enable-gpio1";
                         disable;
                         post-delay = <20>;
                 };
                gpio@4 {
                         id = "enable-gpio1";
                         enable;
                         post-delay = <20>;
                 };
                gpio@5 {
                         id = "enable-gpio2";
                         disable;
                         post-delay = <20>;
                 };
        };
        power-off-sequence {
                gpio@0 {
                        id = "enable-gpio1";
                        disable;
                        post-delay = <20>;
                };
        };
};

I want to know whether this kind of sequence is allowed in DT or not ?

Best Wishes,
Leela Krishna Amudala

On Thu, Aug 9, 2012 at 7:37 AM, Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> On Thu 09 Aug 2012 12:38:09 AM JST, Stephen Warren wrote:
>>
>> On 08/08/2012 07:30 AM, Rob Herring wrote:
>>>
>>> On 08/08/2012 04:52 AM, Leela Krishna Amudala wrote:
>>>>
>>>> Hello All,
>>>>
>>>> I came across that to set power to an LCD, few panels require a pull
>>>> up/pull down operation on single GPIO line
>>>> and few panels need some gpio line setting sequence with some delay in
>>>> between.
>>
>> ...
>>>>
>>>> Putting the sequence in dts file like below for an LCD which requires
>>>> gpio sequence
>>>>                 lcd-reset-gpio = <&gpx1 5 1 3 0>,    (3 - for pull up)
>>>>                                        <&gpx1 5 1 1 0>,    (1 - for pull
>>>> down)
>>>>                                        <&gpx1 5 1 3 0>;    (3 - for pull
>>>> up)
>>>>                 delay = x;
>>>>
>>>> and only one gpio entry in the case of LCD which doesn't require gpio
>>>> sequence setting
>>>>                 lcd-reset-gpio = <&gpx1 5 1 3 0>,    (3 - pull up)
>>>>
>>>> The 4 arguments in the above handle denotes
>>>>
>>>> <[phandle of the gpio controller node]
>>>>        [pin number within the gpio controller]
>>>>        [mux function]
>>>>        [pull up/down]
>>>>        [drive strength]>
>>
>>
>> Mux function, pull-up/down and drive-strength should be handled by the
>> pinctrl subsystem, and associated DT bindings.
>>
>> I suppose the proposal in the "runtime interpreted power sequences"
>> thread could be extended to have an action for activating a particular
>> pinctrl state too.
>
>
> Yup, that would totally make sense. Leela, you might want to try the next
> revision of my patches (coming today or tomorrow) and see how it can be
> extended to fit your needs.
>
> Alex.
>
> -----------------------------------------------------------------------------------
> This email message is for the sole use of the intended recipient(s) and may
> contain
> confidential information.  Any unauthorized review, use, disclosure or
> distribution
> is prohibited.  If you are not the intended recipient, please contact the
> sender by
> reply email and destroy all copies of the original message.
> -----------------------------------------------------------------------------------

--f46d042fdc1eaedc4104c773be9e
Content-Type: image/jpeg; name="gpio_sequence.jpg"
Content-Disposition: attachment; filename="gpio_sequence.jpg"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_h5z540y10

/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAIBAQIBAQICAgICAgICAwUDAwMDAwYEBAMFBwYHBwcG
BwcICQsJCAgKCAcHCg0KCgsMDAwMBwkODw0MDgsMDAz/2wBDAQICAgMDAwYDAwYMCAcIDAwMDAwM
DAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAz/wAARCADJAQwDASIA
AhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA
AAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3
ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm
p6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA
AwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx
BhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK
U1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3
uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD9/KKK
KACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoooo
AKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA
ooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAOb+LfiPxL4V8B3l54Q8NQeLvEYaOKy0251
RdLtpGeRUMk1yUkMUMYJd2SKWTah2RyNhD8v2P8AwU78V3ks3gsfC3Rn+Na/EJ/h7F4fh8XvJ4ek
mTSk1iS+OrfYRMtslg4Zh9hMomKx+WQwkr6A/aug+Kd58BNft/gu/gyD4kXMaQ6TceKp54dMtCzq
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
RRQAUUUUAFFFFABXzb/wUL8F+ITrvwV+ImkeHtZ8Y6X8IfGz+I9e0LSYRc6hc2Umk6hYm5t7ckG4
ltnu0mEKBpXVHEStJtRvpKijW6a3TT+53/TpZ9mnZjurSi9pJp+kk07ednpuu6ex+XX7SnxN+IXx
K+CP7Rkl5rHxx8YfCqOTwVJ4WHinwj/wg+spqEuvsb+ysGex0q5KpELBY55SdjMD9o3B2Wn8Uv2e
Idf+B/7SsnwJ+Efi/wAE/DPxD4W8NafZ+F18D6h4cl1bxDBqMsl7d22lTQxSswtJLKOW5WDbOYeJ
JPJYj9L/AIqfCjQPjZ4Kn8O+J7D+09HuLi2upLfz5Id0lvcR3ELbo2VhtlijbAODtwcgkHoqIe63
bqrfhbXv1avs7O91qql5wlB9Wn5K3Lt2b5Ve295K1mrfmp+2X8D7Pxh8Wv2h7Txp8J/Gvjr4ueJl
tW+CPirTvCV9qMXh6P8AsyGKzSy1mKOS30Ke31aO6uJZJZbU/vY5SZF24+jP29JtV8G+E/gNr2o6
V4o8SDwf4/07Udffw34dv9duYYl02/ikuBa2UU1w0fmyICVRsbxmvp+ikk1GCX2JQku37tprTvK3
vveT16FTak5X2cZx8/fVnr2X2Va0dV1PgP8AaOj1b9pL4yfEbxh4T8I/EK40LXP2cvEWgWUmpeD9
V0e4n1Fr47LP7PeW8U4ncAskZQM64ZQykE4t/wDsSeIfgNqF1B8A/Bt14I8V+MvgBrVpe6vaW72z
6l4nSSwOny6heS/6zUA894VmuXMx3SkthSR+i1FRClGEXBbNSXyl7d/nWb/7diDm3Lnf80ZeXu+x
t+FFL/t5n52f8Epv2e7f4e/tDQavo/2TweLLwlJpuuaFpH7O/iX4cQ6/N5tuYrnUdR1G7uLXUby3
ZZgskbPK4urhvMdCTX6J0UV0VKrmlfp+rb06216t+tjKFNQvbXb10SWvd2XZegUUUVmWFFFFABRR
RQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF
ABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA
FFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU
UUUAf//Z
--f46d042fdc1eaedc4104c773be9e
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--f46d042fdc1eaedc4104c773be9e--
