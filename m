From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [GIT PULL] Devicetree fix for 4.19-rc8
Date: Wed, 10 Oct 2018 22:34:44 +0200
Message-ID: <20181010203444.GA6979@kroah.com>
References: <CAL_JsqL4xQXoQubUEb9p2r5AEV+n1OAW=ss-DVQm4dmWU=n2hw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqL4xQXoQubUEb9p2r5AEV+n1OAW=ss-DVQm4dmWU=n2hw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Frank Rowand <frowand.list@gmail.com>, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 10, 2018 at 06:59:13AM -0500, Rob Herring wrote:
> Hi Greg,
> 
> Please pull this one DT fix for 4.19.
> 
> Note I didn't tag this for stable as I cherry-picked it from my 4.20
> branch and wanted to not touch the commit msg at all. Maybe that
> doesn't matter.

I'll pick it up manually, no worries.

> 
> Rob
> 
> The following changes since commit e54192b48da75f025ae4b277925eaf6aca1d13bd:
> 
>   of: fix phandle cache creation for DTs with no phandles (2018-09-11
> 11:28:40 -0500)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
> tags/devicetree-fixes-for-4.19-3

Now merged, thanks.

greg k-h
