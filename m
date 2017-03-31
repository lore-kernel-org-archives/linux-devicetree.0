From: Raviteja Garimella <raviteja.garimella@broadcom.com>
Subject: Re: [PATCH v3 2/7] UDC: Rename amd5536udc driver file based on IP
Date: Fri, 31 Mar 2017 18:46:04 +0530
Message-ID: <CAEHZuqOAUhJahzuEgEeV+TuWMmgpTXUEUJt8v5BDEb-bh8ryOA@mail.gmail.com>
References: <1490698929-10915-1-git-send-email-raviteja.garimella@broadcom.com>
 <1490698929-10915-3-git-send-email-raviteja.garimella@broadcom.com> <87wpb5ixmo.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87wpb5ixmo.fsf@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Felipe,

On Fri, Mar 31, 2017 at 3:19 PM, Felipe Balbi <balbi@kernel.org> wrote:
>
> Hi,
>
> Raviteja Garimella <raviteja.garimella@broadcom.com> writes:
>
>> This patch renames the amd5536udc.c that has the core driver
>> functionality of Synopsys UDC to snps_udc_core.c
>>
>> The symbols exported here can be used by any UDC driver that uses
>> the same Synopsys IP.
>>
>> Signed-off-by: Raviteja Garimella <raviteja.garimella@broadcom.com>
>
> unfortunately, this patch doesn't apply:
>
> Applying: UDC: Rename amd5536udc driver file based on IP
> error: corrupt patch at line 235
> Patch failed at 0001 UDC: Rename amd5536udc driver file based on IP
> The copy of the patch that failed is found in: .git/rebase-apply/patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
>
> Can you rebase on testing/next and resend?

I rebased my patches against testing/next branch, resolved the merge conflicts.
Just resent the patches 2/7 to 7/7. Please use them. I verified they are getting
applied without issues now.

Thanks,
Ravi
>
> --
> balbi
