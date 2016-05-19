From: Joe Perches <joe@perches.com>
Subject: Re: get_maintainer.pl and MAINTAINERS file
Date: Thu, 19 May 2016 15:32:53 -0700
Message-ID: <1463697173.14098.46.camel@perches.com>
References: <1463574199-21077-1-git-send-email-robin@protonic.nl>
	 <20160518150924.GA3871@kroah.com> <20160519105418.5df3c8f7@erd979>
	 <871t4yfbmy.fsf_-_@kamboji.qca.qualcomm.com> <573E19B5.1050800@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <573E19B5.1050800@suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Slaby <jslaby@suse.cz>, Kalle Valo <kvalo@codeaurora.org>, Robin van der Gracht <robin@protonic.nl>
Cc: Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Kumar Gala <galak@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>, Matt Ranostay <mranostay@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <treding@nvidia.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 2016-05-19 at 21:53 +0200, Jiri Slaby wrote:
> Cc: joe
>=20
> On 05/19/2016, 02:57 PM, Kalle Valo wrote:
> >=20
> > (Changed the subject from "Re: [PATCH v6 0/3] auxdisplay: Introduce=
 ht16k33 driver")
> >=20
> > Robin van der Gracht <robin@protonic.nl> writes:
> >=20
> > >=20
> > > >=20
> > > > And 4th, what is with the insane number of people on cc:?=A0=A0=
Use
> > > > get_maintainer.pl correctly please, and don't just hit everyone=
 you
> > > > can possibly think of with a cc: for no good reason.
> > > I did use the get_maintainer script. I solely passed the patch se=
t as
> > > command line argument.
> > I think get_maintainer script should ignore MAINTAINERS file altoge=
ther.

Maybe, maybe not.
The list of MAINTAINERS names returned by get_maintainer.pl is:

Andrew Morton <akpm@linux-foundation.org> (commit_signer:39/504=3D8%)
"David S. Miller" <davem@davemloft.net> (commit_signer:38/504=3D8%)
Greg Kroah-Hartman <gregkh@linuxfoundation.org> (commit_signer:36/504=3D=
7%)
Kalle Valo <kvalo@codeaurora.org> (commit_signer:28/504=3D6%)
Mauro Carvalho Chehab <mchehab@osg.samsung.com> (added_lines:109/2073=3D=
5%,removed_lines:108/779=3D14%)
Guenter Roeck <linux@roeck-us.net> (removed_lines:48/779=3D6%)
Jiri Slaby <jslaby@suse.com> (removed_lines:46/779=3D6%)

> > After I did drivers/net/wireless reorganisation, and had to make
> > numerous changes to MAINTAINERS in the process, I have been CCed to=
 all
> > sorts of patchsets to which I have nothing to do with (this one
> > included). I suspect get_maintainer.pl is to blame here.

Doubtful but possible.
I have no idea how many files were modified by whatever
patch was checked, but more files, more maintainers.

Unmaintained files have even more "not quite maintainers",
but get_maintainer.pl lists the names of people that recently
modified those specific files.

> Last time I even tried to fix this up, but failed due to time
> limitations as the code is a bit complex.
>=20
> Joe, you seem to be the one who touched the script many times recentl=
y.
> May we ask you to fix this up?

I'm not touching stuff right now. =A0Maybe next month.
