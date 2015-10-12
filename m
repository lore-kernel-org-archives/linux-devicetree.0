From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: Correct property to use for wake up support on rotary encoders
Date: Mon, 12 Oct 2015 09:29:16 -0700
Message-ID: <CAKdAkRSAYRr8PqcmzVCmGy89dedo_aybJq-2FhPzF1CFYy0GYg@mail.gmail.com>
References: <20151012160943.GA10239@gradator.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <20151012160943.GA10239@gradator.net>
Sender: linux-input-owner@vger.kernel.org
To: Sylvain Rochet <sylvain.rochet@finsecur.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, Daniel Mack <daniel@caiaq.de>, Johan Hovold <jhovold@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Sylvain,

On Mon, Oct 12, 2015 at 9:09 AM, Sylvain Rochet
<sylvain.rochet@finsecur.com> wrote:
> Hi,
>
> Several month ago I proposed a patch[1][2] to add wake up support to
> rotary encoders[3].
>
> Among all the properties currently used in Linux kernels device trees,
> we have three recognisable patterns for wake up support:
>  - driver-name,wakeup
>  - linux,wakeup
>  - wakeup-source
>
> We don't know which one to use, could you tell which one we should use
> for GPIO rotary encoders ?
>

Please use "wakeup-source", we've been trying to standardize on it.

-- 
Dmitry
