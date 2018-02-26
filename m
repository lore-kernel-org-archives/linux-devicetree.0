From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 0/6] of: remove kbasename() from core
Date: Mon, 26 Feb 2018 11:42:16 -0800
Message-ID: <48509f67-9e94-ebe6-746b-c1262ea143b0@gmail.com>
References: <1519611750-22355-1-git-send-email-frowand.list@gmail.com>
 <CAMuHMdUj63OQnJWz=Q57dbc1XKOnq+_et5-E_4yQjTZt+c++GQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUj63OQnJWz=Q57dbc1XKOnq+_et5-E_4yQjTZt+c++GQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 02/26/18 01:03, Geert Uytterhoeven wrote:
> Hi Frank,
> 
> On Mon, Feb 26, 2018 at 3:22 AM,  <frowand.list@gmail.com> wrote:
>> From: Frank Rowand <frank.rowand@sony.com>
>>
>> Struct device_node full_name no longer includes the full path
>> name.
> 
> Is this now also true on systems with real Open Firmware?

Thanks, good point.  I can not remove the kbasename() calls.

Will re-spin, as a much smaller patch to deal with the
overlay issues.

-Frank
