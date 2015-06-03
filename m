From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH V2 0/3] Pistachio USB2.0 PHY
Date: Wed, 3 Jun 2015 08:47:47 -0700
Message-ID: <CAL1qeaGr9b3O-aqO+i=301wPsv9eYPmTM+xz15-wqaL8xNPwmQ@mail.gmail.com>
References: <1428444258-25852-1-git-send-email-abrestic@chromium.org>
        <CAL1qeaE0+aMLBgk8SKgJ3fXm==M2-Z_yEPYNVZ0yxSee-p7YOw@mail.gmail.com>
        <5549083F.8080505@imgtec.com>
        <5550C06D.2010409@ti.com>
        <556E99B4.6090307@ti.com>
        <CAL1qeaFdcqUoivOkBjbGEtMovDow08_j68k+Z7mxrY==OAhAWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <CAL1qeaFdcqUoivOkBjbGEtMovDow08_j68k+Z7mxrY==OAhAWA@mail.gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Linux-MIPS <linux-mips@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, James Hartley <james.hartley@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 3, 2015 at 8:44 AM, Andrew Bresticker <abrestic@chromium.org> wrote:
> On Tue, Jun 2, 2015 at 11:07 PM, Kishon Vijay Abraham I <kishon@ti.com> wrote:
>>
>>
>> On Monday 11 May 2015 08:15 PM, Kishon Vijay Abraham I wrote:
>>>
>>>
>>>
>>> On Tuesday 05 May 2015 11:43 PM, Ezequiel Garcia wrote:
>>>>
>>>> Hi Kishon,
>>>>
>>>>>
>>>>> This series adds support for the USB2.0 PHY present on the IMG Pistachio
>>>>> SoC.
>>>>>
>>>>> Based on mips-for-linux-next and tested on the IMG Pistachio BuB.  If
>>>>> possible,
>>>>> I'd like this to go through the MIPS tree with Kishon's ACK.
>>>>>
>>>>
>>>> Tested-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
>>>>
>>>> Can we have your Ack for this series so Ralf can pick it?
>>>
>>>
>>> sure..
>>>
>>> Acked-by: Kishon Vijay Abraham I <kishon@ti.com>
>>
>>
>> I'm not sure if this has been merged yet. But this will cause conflicts with
>> other PHY patches in Makefile and Kconfig when linus merges to his tree. I'd
>> prefer the phy patches go in PHY tree itself.
>
> It doesn't look like Ralf has picked these up, so if you want to take
> them through your tree, that would be great.

Actually I take that back, looks like Ralf just picked them up.
