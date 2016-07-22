From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3] of: fix memory leak related to safe_name()
Date: Fri, 22 Jul 2016 14:58:06 -0500
Message-ID: <CAL_JsqJaWky61QA0qdKozyriYpZiR2poY+U-7a9Latr7z_FoSA@mail.gmail.com>
References: <5762E732.1030908@gmail.com> <CA+7wUsziB9P24bXnSrLB_t-KOZ2CVj9p5xZYsCnr5DNZL8mg+w@mail.gmail.com>
 <CAL_JsqK=h5EC4RR4xpn-JioAbdLfmQFNt8MJk=UF==WvDWy-wQ@mail.gmail.com> <CA+7wUsyXMPu05mz4Mi6ELF=PJGLp82DTMFOHTZmQ2OHX_TdjWw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+7wUsyXMPu05mz4Mi6ELF=PJGLp82DTMFOHTZmQ2OHX_TdjWw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Malaterre <mathieu.malaterre@gmail.com>
Cc: Frank Rowand <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 20, 2016 at 1:03 AM, Mathieu Malaterre
<mathieu.malaterre@gmail.com> wrote:
> On Fri, Jun 24, 2016 at 10:38 PM, Rob Herring <robh+dt@kernel.org> wrote:
>> On Fri, Jun 17, 2016 at 2:51 AM, Mathieu Malaterre
>> <mathieu.malaterre@gmail.com> wrote:
>>> v3 tested here multiple times ! memleak is now gone.
>>>
>>> Tested-by: Mathieu Malaterre <mathieu.malaterre@gmail.com>
>>>
>>> Thanks
>>>
>>> On Thu, Jun 16, 2016 at 7:51 PM, Frank Rowand <frowand.list@gmail.com> wrote:
>>>> From: Frank Rowand <frank.rowand@am.sony.com>
>>>>
>>>> Fix a memory leak resulting from memory allocation in safe_name().
>>>> This patch fixes all call sites of safe_name().
>>
>> Applied, thanks.
>>
>> Rob
>
> Could this patch be considered for stable ?

Yes, I tagged it for stable. I didn't send it for 4.7, so it won't go
in until after 4.8-rc1 though.

Rob
