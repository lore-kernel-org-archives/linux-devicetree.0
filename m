From: Jiri Slaby <jslaby@suse.cz>
Subject: Re: get_maintainer.pl and MAINTAINERS file
Date: Thu, 19 May 2016 21:53:25 +0200
Message-ID: <573E19B5.1050800@suse.cz>
References: <1463574199-21077-1-git-send-email-robin@protonic.nl>
 <20160518150924.GA3871@kroah.com> <20160519105418.5df3c8f7@erd979>
 <871t4yfbmy.fsf_-_@kamboji.qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <871t4yfbmy.fsf_-_@kamboji.qca.qualcomm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kalle Valo <kvalo@codeaurora.org>, Robin van der Gracht <robin@protonic.nl>, Joe Perches <joe@perches.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Kumar Gala <galak@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>, Matt Ranostay <mranostay@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <treding@nvidia.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Cc: joe

On 05/19/2016, 02:57 PM, Kalle Valo wrote:
> (Changed the subject from "Re: [PATCH v6 0/3] auxdisplay: Introduce ht16k33 driver")
> 
> Robin van der Gracht <robin@protonic.nl> writes:
> 
>>> And 4th, what is with the insane number of people on cc:?  Use
>>> get_maintainer.pl correctly please, and don't just hit everyone you
>>> can possibly think of with a cc: for no good reason.
>>
>> I did use the get_maintainer script. I solely passed the patch set as
>> command line argument.
> 
> I think get_maintainer script should ignore MAINTAINERS file altogether.
> After I did drivers/net/wireless reorganisation, and had to make
> numerous changes to MAINTAINERS in the process, I have been CCed to all
> sorts of patchsets to which I have nothing to do with (this one
> included). I suspect get_maintainer.pl is to blame here.

Last time I even tried to fix this up, but failed due to time
limitations as the code is a bit complex.

Joe, you seem to be the one who touched the script many times recently.
May we ask you to fix this up?

thanks,
-- 
js
suse labs
