From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH V1 1/3] mfd: stmpe: Arrange #include <header files> in
 alphabetical order
Date: Mon, 26 Nov 2012 17:05:43 +0100
Message-ID: <20121126160543.GV12685@sortiz-mobl>
References: <57384ebc52c7d39d1bae31ba3baa6f820b4ac696.1353610436.git.viresh.kumar@linaro.org>
 <20121126111639.GR12685@sortiz-mobl>
 <CAKohpo=EpjP4gpbBTV8BaghCjLVC4x4wvgRW34M9pn0oZ-S5dw@mail.gmail.com>
 <20121126132557.GA6824@gmail.com>
 <CAKohpo=7CEbKgEQ8KbnVpS0Opxn9xjDP26atZBefgHcxXVbMkA@mail.gmail.com>
 <20121126153145.GC6824@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20121126153145.GC6824@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com
List-Id: devicetree@vger.kernel.org

On Mon, Nov 26, 2012 at 03:31:45PM +0000, Lee Jones wrote:
> On Mon, 26 Nov 2012, Viresh Kumar wrote:
> 
> > On 26 November 2012 18:55, Lee Jones <lee.jones@linaro.org> wrote:
> > 
> > > Why do you need to sort them? Is there _really_ a need?
> > 
> > Many people & maintainers like to have their header files ordered. The
> > reason for that is:
> > 
> > If they are not ordered, there is a possibility of adding an header file
> > multiple times in a file. This might not do something serious
> > when thinking about compilation time or Image size, but adding an header
> > file multiple times is simply wrong.
> > 
> > This can't be caught in patch reviews most of the time, as diff may not show
> > the earlier inclusion.
> > 
> > That's why i ordered them. And i don't see any harm in doing so.
> 
> I don't see any harm in it, but it's pretty pointless.
> 
> There aren't many maintainers who insist on such things, 
And I'm not one of those.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
