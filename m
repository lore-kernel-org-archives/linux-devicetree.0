From: Rameshwar Sahu <rsahu@apm.com>
Subject: Re: [PATCH] dmaengine: xgene-dma: Fix "incorrect type in assignement" warnings
Date: Wed, 3 Jun 2015 12:37:57 +0530
Message-ID: <CAFd313xEKKqqNDLPpmPdT_Hsd0LstDtsBvE-z0mhaaVv_KhDJg@mail.gmail.com>
References: <1433235813-3225-1-git-send-email-rsahu@apm.com>
	<20150602133538.GZ3140@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150602133538.GZ3140@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: dan.j.williams@intel.com, dmaengine@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jcm@redhat.com, patches@apm.com
List-Id: devicetree@vger.kernel.org

On Tue, Jun 2, 2015 at 7:05 PM, Vinod Koul <vinod.koul@intel.com> wrote:
>
> On Tue, Jun 02, 2015 at 02:33:33PM +0530, Rameshwar Prasad Sahu wrote:
> > This patch fixes sparse warnings like incorrect type in assignment
> > (different base types), cast to restricted __le64.
> >
> I am appliying this but ideally you should have split thsi into seprate
> patches for each fix



Thanks, I will take care this for next time.
Ram
>
>
> --
> ~Vinod
>
