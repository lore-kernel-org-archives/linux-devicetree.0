From: Duc Dang <dhdang@apm.com>
Subject: Re: [PATCH 0/2 RESEND] power: reset: Add syscon reboot/poweroff
 device nodes for APM X-Gene platform
Date: Tue, 28 Jul 2015 10:51:18 -0700
Message-ID: <CADaLNDkaoFC-Hj7fk+iadm0tuimpNG6C3TqoLBBanEZ=gnntJQ@mail.gmail.com>
References: <1433272747-27114-1-git-send-email-ttnguyen@apm.com>
 <20150714084004.GA14593@localhost> <CAPw-ZT=d2=dh-Hjugo9BStCuhTp82MMapUa1EGrD01EoTOG-nA@mail.gmail.com>
 <CAOesGMhKRxUtr6XXsZgCJVUFTFL3eHySP8y-SmEzi=R53MxLRw@mail.gmail.com>
 <CAPw-ZTnk8cZyFyMnBMUYXuxs9=2ydqxOzm+dYsg-=9_Suq+q7A@mail.gmail.com>
 <CAOesGMimzcUDW4e1etxZNerEusWmEtT_um8XZoT0MkFpCnTf5w@mail.gmail.com>
 <CADaLNDmPqb73UrOaVphkywZh8mfd4sPdA6i25USLt53sZ3hFuw@mail.gmail.com> <20150726183742.GA24272@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150726183742.GA24272@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Loc Ho <lho@apm.com>, Tai Nguyen <ttnguyen@apm.com>, "arm@kernel.org" <arm@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "patches@apm.com" <patches@apm.com>, Jon Masters <jcm@redhat.com>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 26, 2015 at 11:37 AM, Olof Johansson <olof@lixom.net> wrote:
> On Sat, Jul 25, 2015 at 11:34:42AM -0700, Duc Dang wrote:
>> Hi Olof,
>>
>> We are debating whether we should setup a company server (where we can
>> have full control about storage, user permissions, backup, ...) or
>> just use github.com to host our X-Gene kernel tree.
>>
>> Github seems already provide everything we need for a public source
>> tree. Per your experience, what is your (and probably other
>> maintainers) reference in git hosting server? Is there any
>> inconvenience or difficulty for the maintainers to pull/merge code
>> from Github versus from a company server?
>
> Hosting on github is fine with us in general. We do prefer to get
> signed pull requests in particular when they come from other sources
> than kernel.org, mostly because there's another third party involved in
> hosting the repo and by using signed tags there's less room for anyone
> to do bad stuff with the repository without someone noticing.
>
> If you host on github, please still use native git pull requests and not the
> ones that github provides via the web interface.
>
> Note however, that given the total volume of patches there's no strong need for
> you to have a public repo just to send code to us -- we're happy applying
> patches at the volumes we're currently looking at. I can imagine other reasons
> for why you would like to have a public repo though.
>

Thanks for the information, Olof.

We are setting up a public repo on Github. I will make sure that
native git pull request is used.

I will need your help in signing the PGP key when the repo is ready.

>
> Thanks,
>
> -Olof

-- 
Regards,
Duc Dang.
