From: Moritz Fischer <moritz.fischer.private-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] fpga: Add support for Xilinx LogiCORE PR Decoupler
Date: Mon, 13 Mar 2017 09:18:31 -0700
Message-ID: <CAJYdmeM+OkvNHtXR7o7R7s418Q52KGDFH5B-oKWeMq-tkmwW2Q@mail.gmail.com>
References: <1489181435-3151-1-git-send-email-mdf@kernel.org>
 <1489181435-3151-2-git-send-email-mdf@kernel.org> <CAAtXAHe-AMq9Ux2LZZEWLcg8Dk6jTiHhrot4RhEVrxTBhnLE0g@mail.gmail.com>
 <2f21aeb3-dd4e-e170-729a-a785077b6f28@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2f21aeb3-dd4e-e170-729a-a785077b6f28-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 13, 2017 at 3:27 AM, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wro=
te:
> Hi Moritz,
>
> On 10.3.2017 23:42, Moritz Fischer wrote:
>> On Fri, Mar 10, 2017 at 1:30 PM, Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>> This adds support for the Xilinx LogiCORE PR Decoupler
>>> soft-ip that does decoupling of PR regions in the FPGA
>>> fabric during partial reconfiguration.
>>>
>>> Signed-off-by: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>> Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>>> Cc: S=C3=B6ren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>>> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> ---
>>>  drivers/fpga/Kconfig               |   9 +++
>>>  drivers/fpga/Makefile              |   1 +
>>>  drivers/fpga/xilinx-pr-decoupler.c | 156 +++++++++++++++++++++++++++++=
++++++++
>>>  3 files changed, 166 insertions(+)
>>>  create mode 100644 drivers/fpga/xilinx-pr-decoupler.c
>
> I have written very similar driver some week ago but didn't sent it out.

Hah. I'll take a look.

> Here it is.
> https://github.com/Xilinx/linux-xlnx/blob/master/drivers/fpga/xilinx-pr-d=
ecoupler.c
>
> Your clk handling is better and my enable_show is better.
> You shouldn't rely on setting status before. It is better to read that
> reg again. The reason is you can connect status signal from one PR
> decoupler to decouple input which can change status

I will just merge them together and add you to author's list if that's
fine with you?

> There is another topic I wanted to open in connection to this. There
> should be gpio based bridge because this pr decoupler can be without axi
> interface and for that gpio driver would be useful.

That's a good idea. I can look at that. This can be pretty generic
code I suppose.

Cheers,

Moritz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
