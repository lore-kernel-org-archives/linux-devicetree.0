From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [RESEND v4 2/6] remoteproc: debugfs: Add ability to boot remote
 processor using debugfs
Date: Mon, 28 Dec 2015 10:38:04 -0800
Message-ID: <CAJAp7OhvwxkS5WkvBgd0ncBRMRCijnU2LggY8oyJ5sHg+5aohQ@mail.gmail.com>
References: <1448370862-19120-1-git-send-email-lee.jones@linaro.org>
	<2600153.9u9Z7N2IT1@wuerfel>
	<20151203172830.GB26902@x1>
	<2473673.tSymyNlg3h@wuerfel>
	<20151204082427.GC26902@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151204082427.GC26902@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Ohad Ben-Cohen <ohad@wizery.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, kernel@stlinux.com, Nathan Lynch <Nathan_Lynch@mentor.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, ludovic.barre@st.com, Maxime Coquelin <maxime.coquelin@st.com>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 4, 2015 at 12:24 AM, Lee Jones <lee.jones@linaro.org> wrote:
> On Thu, 03 Dec 2015, Arnd Bergmann wrote:
>
>> On Thursday 03 December 2015 17:28:30 Lee Jones wrote:
>> > >
>> > > Ah, interesting. I haven't tried myself, and just tried to read the
>> > > code. Maybe glibc already catches zero-length writes before it gets
>> > > into the kernel, or I just missed the part of the syscall that checks
>> > > for this.
>> >
>> > Glibc is responsible indeed:
>> >
>> >   http://osxr.org/glibc/source/io/write.c
>>
>> Ok, so an attacker can force the stack overflow by calling
>> syscall(__NR_write, fd, p, 0) if that has any potential value,
>> but normal users won't hit this case.
>
> Right.  I have fixed the issue (and another one I found) anyway, if
> only to rid the GCC warning.
>

Sorry, but I'm unable to find a new version of this patch, did I miss
it or could you resend it?


Also, as I looked at this again, we should probably return an error if
count >= sizeof(buf) rather than just acknowledging the input (same in
the other debugfs write function in this file).

Regards,
Bjorn
