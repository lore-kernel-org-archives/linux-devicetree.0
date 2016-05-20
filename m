From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: get_maintainer.pl and MAINTAINERS file
Date: Fri, 20 May 2016 16:14:19 +0300
Message-ID: <87a8jkdg7o.fsf@kamboji.qca.qualcomm.com>
References: <1463574199-21077-1-git-send-email-robin@protonic.nl>
	<20160518150924.GA3871@kroah.com> <20160519105418.5df3c8f7@erd979>
	<871t4yfbmy.fsf_-_@kamboji.qca.qualcomm.com>
	<CAFLxGvwU-2aE7_0Suht--DvWby3RT=mdkpRomHz25MgicRfC3w@mail.gmail.com>
	<20160519135743.5fc661c4@recife.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160519135743.5fc661c4@recife.lan> (Mauro Carvalho Chehab's
	message of "Thu, 19 May 2016 13:57:43 -0300")
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Richard Weinberger <richard.weinberger@gmail.com>, Robin van der Gracht <robin@protonic.nl>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>, Thierry Reding <treding@nvidia.com>, Shawn Guo <shawnguo@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Matt Ranostay <mranostay@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, "David S . Miller" <davem@davemloft.net>, Guenter Roeck <linux@roeck-us.net>, Jiri Slaby <jslaby@suse.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Mauro Carvalho Chehab <mchehab@osg.samsung.com> writes:

> Em Thu, 19 May 2016 16:25:45 +0200
> Richard Weinberger <richard.weinberger@gmail.com> escreveu:
>
>> On Thu, May 19, 2016 at 2:57 PM, Kalle Valo <kvalo@codeaurora.org> wrote:
>> > (Changed the subject from "Re: [PATCH v6 0/3] auxdisplay: Introduce ht16k33 driver")
>> >
>> > Robin van der Gracht <robin@protonic.nl> writes:
>> >  
>> >>> And 4th, what is with the insane number of people on cc:?  Use
>> >>> get_maintainer.pl correctly please, and don't just hit everyone you
>> >>> can possibly think of with a cc: for no good reason.  
>> >>
>> >> I did use the get_maintainer script. I solely passed the patch set as
>> >> command line argument.  
>> >
>> > I think get_maintainer script should ignore MAINTAINERS file altogether.
>> > After I did drivers/net/wireless reorganisation, and had to make
>> > numerous changes to MAINTAINERS in the process, I have been CCed to all
>> > sorts of patchsets to which I have nothing to do with (this one
>> > included). I suspect get_maintainer.pl is to blame here.  
>> 
>> Are you sure it is because you are listed as maintainer for specific files?
>> If you are maintain something you have to be CC'ed.

IIRC I have received patches about i2c and graphics stuff and I have no
recollection of ever sending even a single patch to those subsystems,
let alone maintaining them.

>> It is rather because get_maintainer.pl tries to be smart and uses git to
>> find people who have touched a file...
>> 
>> I guess instead you want something like:
>> http://permalink.gmane.org/gmane.linux.kernel.commits.head/538561
>
> I guess what Kalle said is that the get_maintainer.pl script should
> disable, by default, "--git-blame" behavior for some specific files that
> everyone touches like /MAINTAINERS, Documentation/kernel-parameters.txt,
> /CREDITS, etc,  as random people that touch on those files aren't really
> interested on being c/c to every change there.

Exactly my point, thank you. No need to pollute people's inboxes
unnecessary.

-- 
Kalle Valo
