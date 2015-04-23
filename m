From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v3 3/4] base/platform: Continue on insert_resource() error
Date: Thu, 23 Apr 2015 08:26:37 -0500
Message-ID: <20150423132637.GK20701@google.com>
References: <1429719261-18024-1-git-send-email-ricardo.ribalda@gmail.com>
 <1429719261-18024-4-git-send-email-ricardo.ribalda@gmail.com>
 <20150422164457.GI20701@google.com>
 <CAPybu_3Wfngh_gh_pa33dWF_nfUh0He1GKe26kJ49w-Sdn604Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAPybu_3Wfngh_gh_pa33dWF_nfUh0He1GKe26kJ49w-Sdn604Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Jakub Sitnicki <jsitnicki@gmail.com>, Vivek Goyal <vgoyal@redhat.com>, Jiang Liu <jiang.liu@linux.intel.com>, Mike Travis <travis@sgi.com>, Thierry Reding <treding@nvidia.com>, LKML <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 23, 2015 at 09:55:13AM +0200, Ricardo Ribalda Delgado wrote:
> Hi Bjorn:
> 
> On Wed, Apr 22, 2015 at 6:44 PM, Bjorn Helgaas <bhelgaas@google.com> wrote:
> 
> > Usual style for referencing a commit is "(see 02bbde7849e6 ('Revert "of:
> > use platform_device_add"'))".
> 
> Do you make that reference manually or there is a magic git command
> for printing it in that style?

I used to do it mostly by hand, but thanks to your prompting, I fiddled
around and came up with this alias:

gsr is aliased to `git show -s --abbrev-commit --abbrev=12 --pretty=format:"%h (\"%s\")%n"'

Bjorn
