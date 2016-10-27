From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC PATCH 00/13] of: Make drivers/of/resolver.c more readable
Date: Thu, 27 Oct 2016 07:03:53 -0500
Message-ID: <CAL_JsqKX4nahQ4o1FtPLfqqbYM2-pm9QbsobaaRzo8z7arJEjQ@mail.gmail.com>
References: <1477429146-27039-1-git-send-email-frowand.list@gmail.com> <580FC874.4000401@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <580FC874.4000401@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 25, 2016 at 4:02 PM, Frank Rowand <frowand.list@gmail.com> wrote:
> On 10/25/16 13:58, frowand.list@gmail.com wrote:
>> From: Frank Rowand <frank.rowand@am.sony.com>
>>
>> drivers/of/resolve.c is a bit difficult to read.  Clean it up so
>> that review of future overlay related patches will be easier.
>
> < snip >
>
> Hi Pantelis,
>
> Can you test this patch series on some real hardware?

Did you run unit tests?

Rob
