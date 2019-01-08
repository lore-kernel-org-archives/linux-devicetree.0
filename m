From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: Re: New IIO/counter driver
Date: Tue, 8 Jan 2019 09:46:32 +0900
Message-ID: <20190108004632.GA3247@icarus>
References: <CAKKE0ZHmODzhvjPNJFVgT2cF_F=f2kNKr5K_CGP+0XgA5XZokw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKKE0ZHmODzhvjPNJFVgT2cF_F=f2kNKr5K_CGP+0XgA5XZokw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Patrick Havelange <patrick.havelange@essensium.com>, Jonathan Cameron <jic23@kernel.org>, gregkh@linuxfoundation.org
Cc: linux-iio@vger.kernel.org, fabrice.gasnier@st.com, benjamin.gaignard@st.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, akpm@linux-foundation.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 07, 2019 at 02:45:37PM +0100, Patrick Havelange wrote:
> Hello,
> 
> I'm in the process of adding a new IIO/counter driver, however I also saw
> that there was a work in progress to have a separate counter subsystem (
> https://marc.info/?l=linux-iio&m=153974167727206 ). But it seems there is
> no recent progress on it.
> What is the state of those patches ? Is it still interesting to develop the
> driver as an IIO/counter , or should I use already that new subsystem ?
> 
> Best Regards,
> 
> Patrick Havelange.

Hello,

I am still open to merging this patchset and maintaining the Counter
subsystem. However, I took the lack of response for my latest
submission to indicate a loss of interest in this patchset's approach.
If there are still people who want this, I can rebase and resend this
patchset for submission; the past few versions have primarily been code
clarity and documentation changes so I believe the core design itself is
somewhat stable now.

Just let me know how best to proceed and I shall be happy to oblige --
whether to continue maintaining this patchset or to drop this design in
favor of improving the existing IIO Counter code in the kernel.

I'll CC those from the patchset submission to keep them in the loop.

Sincerely,

William Breathitt Gray
