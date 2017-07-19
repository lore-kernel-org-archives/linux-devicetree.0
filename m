From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] usb: Convert to using %pOF instead of full_name
Date: Wed, 19 Jul 2017 09:04:59 -0500
Message-ID: <CAL_Jsq+iKC6GdCLVVsfzYewFLHUGnOXL-7118aR+hxUkv_P9-w@mail.gmail.com>
References: <20170718214339.7774-55-robh@kernel.org> <87lgnk6fhw.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87lgnk6fhw.fsf@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 19, 2017 at 2:40 AM, Felipe Balbi <balbi@kernel.org> wrote:
>
> Hi,
>
> Rob Herring <robh@kernel.org> writes:
>> Now that we have a custom printf format specifier, convert users of
>> full_name to use %pOF instead. This is preparation to remove storing
>> of the full path string for each node.
>>
>> Signed-off-by: Rob Herring <robh@kernel.org>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Felipe Balbi <balbi@kernel.org>
>> Cc: linux-usb@vger.kernel.org
>
> is this going through your tree?

No, please apply.

>
> Acked-by: Felipe Balbi <felipe.balbi@linux.intel.com>
>
> --
> balbi
