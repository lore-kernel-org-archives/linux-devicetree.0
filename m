From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Linux-3.14-rc2: Order of serial node compatibles in DTS files.
Date: Tue, 11 Feb 2014 23:51:43 +0100
Message-ID: <52FAA97F.4060600@gmail.com>
References: <OF784BA598.ACFE9DA4-ONCA257C76.00827472-CA257C77.000BCFAD@csc.com> <20140206082635.GA7048@visitor2.iram.es> <OFA4C1AF9F.B23E83EC-ONCA257C78.00044235-CA257C78.00080D50@csc.com> <20140207101036.GA823@visitor2.iram.es> <alpine.LRH.2.00.1402071348380.10318@ra8135-ec1.am.freescale.net> <20140210110342.GA15806@visitor2.iram.es> <alpine.LRH.2.00.1402101056410.10318@ra8135-ec1.am.freescale.net> <20140211072606.GA26514@visitor2.iram.es> <OF6F6A0029.3B20EF5B-ONCA257C7C.0071BFDA-CA257C7C.00732AD3@csc.com> <63AEBD99-AA87-4FD7-BBDA-0CE419959F14@kernel.crashing.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <63AEBD99-AA87-4FD7-BBDA-0CE419959F14-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Stephen N Chivers <schivers-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Chris Proctor <cproctor-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/11/2014 11:33 PM, Kumar Gala wrote:
>
> On Feb 11, 2014, at 2:57 PM, Stephen N Chivers <schivers-znpAAEhiOVUQrrorzV6ljw@public.gmane.org> wrote:
>
>> I have been trial booting a 3.14-rc2 kernel for a 85xx platform
>> (dtbImage).
>>
>> After mounting the root filesystem there are no messages from the init
>> scripts
>> and the serial console is not available for login.
>>
>> In the kernel log messages there is:
>>
>> of_serial f1004500.serial: Unknown serial port found, ignored.
>>
>> The serial nodes in boards dts file are specified as:
>>
>>         serial0: serial@4500 {
>>                         cell-index = <0>;
>>                         device_type = "serial";
>>                         compatible = "fsl,ns16550", "ns16550";
>>                         reg = <0x4500 0x100>;
>>                         clock-frequency = <0>;
>>                         interrupts = <0x2a 0x2>;
>>                         interrupt-parent = <&mpic>;
>>                 };
>>
>> Reversing the order of the compatible:
>>
>>         compatible = "ns16550", "fsl,ns16550";
>>
>> restores the serial console.
>>
>> Linux-3.13 does not have this behaviour.
>>
>> There are 49 dts files in Linux-3.14-rc2 that have the fsl,ns16550
>> compatible first.
>
> Hmm,
>
> Wondering if this caused the issue:
>
> commit 105353145eafb3ea919f5cdeb652a9d8f270228e
> Author: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Date:   Tue Dec 3 14:52:00 2013 +0100
>
>      OF: base: match each node compatible against all given matches first

[adding Arnd on Cc]

Could be. I checked tty/serial/of_serial.c and it does not provide a
compatible for "fsl,ns16550". Does reverting the patch fix the issue
observed?

I don't think the missing compatible is causing it, but of_serial
provides a DT match for .type = "serial" just to fail later on
with the error seen above.

The commit in question reorders of_match_device in a way that match
table order is not relevant anymore. This can cause it to match
.type = "serial" first here.

Rather than touching the commit, I suggest to remove the problematic
.type = "serial" from the match table. It is of no use anyway.

Sebastian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
