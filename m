From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v10 1/2] Documentation: DT: Add OV5647 bindings
Date: Wed, 15 Mar 2017 11:58:25 -0500
Message-ID: <CAL_Jsq+jYk+12UApckEeytzms3Rzdrq9DE35Jh6gaK8OY7AgrA@mail.gmail.com>
References: <cover.1488798062.git.roliveir@synopsys.com> <e89902c0c99d0daf9ef821dd7a9c67e866b18a94.1488798062.git.roliveir@synopsys.com>
 <20170315164209.p24r7mpyijbxleja@rob-hp-laptop> <0e89fb01-ce6f-5d61-4da9-fc93c1805c34@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0e89fb01-ce6f-5d61-4da9-fc93c1805c34-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ramiro Oliveira <Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, CARLOS.PALMINHA-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Steve
List-Id: devicetree@vger.kernel.org

On Wed, Mar 15, 2017 at 11:51 AM, Ramiro Oliveira
<Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> wrote:
> Hi Rob
>
> On 3/15/2017 4:42 PM, Rob Herring wrote:
>> On Mon, Mar 06, 2017 at 11:16:33AM +0000, Ramiro Oliveira wrote:
>>> Create device tree bindings documentation.
>>>
>>> Signed-off-by: Ramiro Oliveira <roliveir-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>>> ---
>>>  .../devicetree/bindings/media/i2c/ov5647.txt       | 35 ++++++++++++++++++++++
>>>  1 file changed, 35 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.txt
>>
>> There's no changelog here, so I can't tell if anything is changed, but I
>> acked v7. Please add acks when sending new versions.
>>
>
> The changelog is in the cover letter, although I didn't specify which changes
> where made in the driver and which were made in the Documentation.
>
> The only change was removing the clock name since there was only one clock used.
>
> Should I keep your ack?

Yes.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
