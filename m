From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH v10 5/5] Watchdog: ARM SBSA Generic Watchdog half timeout
 panic support
Date: Wed, 3 Feb 2016 12:26:10 -0600
Message-ID: <56B24642.8090105@codeaurora.org>
References: <1454519923-25230-1-git-send-email-fu.wei@linaro.org>
 <1454519923-25230-6-git-send-email-fu.wei@linaro.org>
 <56B23883.7000501@codeaurora.org>
 <CADyBb7sxPg-QUjTbeHFtYkctKc_g7D8O=+jqbXN+DCCoCEnFqA@mail.gmail.com>
 <56B23E99.1030604@codeaurora.org>
 <CADyBb7s4opxfPFuX=1-qEE6uhsaMXgofAJPbHUQHrng2AUwqNA@mail.gmail.com>
 <56B2423B.1020109@codeaurora.org>
 <CADyBb7uULCn97ea19zH8dB4QX1QA8=AXL94d6gXgFxXM8haBNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CADyBb7uULCn97ea19zH8dB4QX1QA8=AXL94d6gXgFxXM8haBNA@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Fu Wei <fu.wei@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Pawe=c5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Wim Van Sebroeck <wim@iguana.be>, Guenter Roeck <linux@roeck-us.net>, Jon Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>, LKML <linux-kernel@vger.kernel.org>, linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Linaro ACPI Mailman List <linaro-acpi@lists.linaro.org>, rruigrok@codeaurora.org, "Abdulhamid, Harb" <harba@codeaurora.org>, Christopher Covington <cov@codeaurora.org>, Dave Young <dyoung@redhat.com>, Pratyush Anand <panand@redhat.com>, G Gregory <graeme.gregory@linaro.org>, Al
List-Id: devicetree@vger.kernel.org

Fu Wei wrote:
> Actually,
> the SBSA watchdog driver should support only  half-timeout for panic
> the user cannot configure the length of "panic time",  He can only
> enable it, and it is automatically set to 1/2 timeout.
>
> we don't need pre-timeout here.
>
> Hope I understand you correctly:-)  sorry for your confusion
>
>> >
>> >So when pre-timeout occurs, the interrupt handler calls panic() or whatever
>> >it's supposed to do.
> Actually,
> So when 1/2 timeout occurs, the interrupt handler calls panic() or
> whatever it's supposed to do.
>

I understand all that.  What I'm saying is that, in the future, when 
pre-timeout support is added to the watchdog layer, I think it makes 
sense to modify this driver to use pre-timeout support.
