From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH v8 1/5] Documentation: add sbsa-gwdt driver documentation
Date: Fri, 30 Oct 2015 15:37:40 -0500
Message-ID: <5633D514.4060102@codeaurora.org>
References: <1445961999-9506-1-git-send-email-fu.wei@linaro.org>
 <1445961999-9506-2-git-send-email-fu.wei@linaro.org>
 <20151027162257.GJ3091@leverpostej>
 <CADyBb7sAcT4bXrkNo2GKx1Tw5wOuf8JeMgCoiAw=owHqvYx6ug@mail.gmail.com>
 <CAOZdJXVan3xaYAS_+150nDO1ogWh+PtkQAZvwrHusJhY4R1a4A@mail.gmail.com>
 <CADyBb7sPqsoQdYBUpHY2HvZ+iT7ABa9NoCX7Jax1NKugYOy1zQ@mail.gmail.com>
 <5633BCA4.1050400@codeaurora.org> <20151030190514.GD30791@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20151030190514.GD30791@leverpostej>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Fu Wei <fu.wei@linaro.org>, Linaro ACPI Mailman List <linaro-acpi@lists.linaro.org>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, Wei Fu <tekkamanninja@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Guenter Roeck <linux@roeck-us.net>, Vipul Gandhi <vgandhi@codeaurora.org>, Wim Van Sebroeck <wim@iguana.be>, Jon Masters <jcm@redhat.com>, Leo Duran <leo.duran@amd.com>, Jon Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rafael Wysocki <rjw@rjwysocki.net>, Dave Young <dyoung@redhat.com>, Pratyush Anand <panand@redhat.com>, Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>, Rob Herring <robherring2@gmail.com>
List-Id: devicetree@vger.kernel.org

On 10/30/2015 02:05 PM, Mark Rutland wrote:
> I was only asking why the interrupt was optional, and it seems per the
> spec it's expected to be handed to an agent at a higher exception level.
>
> That implies that the OS should only care about WS0, assuming that I've
> understood correctly.

Yes, this my understand as well.  Apologies if I didn't get that across.

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
