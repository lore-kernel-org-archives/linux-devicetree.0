From: Logan Gunthorpe <logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC v4 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Date: Thu, 21 Mar 2019 09:56:10 -0600
Message-ID: <ce355f5c-189c-816c-cde4-fb4e816d44e7@deltatee.com>
References: <20190214213729.21702-1-brendanhiggins@google.com>
 <6d9b3b21-1179-3a45-7545-30aa15306cb4@deltatee.com>
 <01b2a950f661e8ebd6acbc45c2f89c8f10063daf.camel@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
In-Reply-To: <01b2a950f661e8ebd6acbc45c2f89c8f10063daf.camel-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Content-Language: en-CA
List-Unsubscribe: <https://lists.01.org/mailman/options/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/linux-nvdimm/>
List-Post: <mailto:linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
List-Help: <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=subscribe>
Errors-To: linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Sender: "Linux-nvdimm" <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
To: Knut Omang <knut.omang-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, keescook-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, mcgrof-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kieran.bingham-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: brakmo-b10kYP2dOMg@public.gmane.org, pmladek-IBi9RG/b67k@public.gmane.org, amir73il-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Alexander.Levin-0li6OtcxBFHby3iVrkZq2A@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, wfg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, jdike-OPE4K8JWMJJBDgjK7y7TUQ@public.gmane.org, dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tim.Bird-7U/KSKJipcs@public.gmane.org, linux-um-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org, julia.lawall-L2FTfq7BK8M@public.gmane.org, kunit-dev-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 2019-03-20 11:23 p.m., Knut Omang wrote:
> Testing drivers, hardware and firmware within production kernels was the use
> case that inspired KTF (Kernel Test Framework). Currently KTF is available as a
> standalone git repository. That's been the most efficient form for us so far, 
> as we typically want tests to be developed once but deployed on many different
> kernel versions simultaneously, as part of continuous integration.

Interesting. It seems like it's really in direct competition with KUnit.
I didn't really go into it in too much detail but these are my thoughts:

>From a developer perspective I think KTF not being in the kernel tree is
a huge negative. I want minimal effort to include my tests in a patch
series and minimal effort for other developers to be able to use them.
Needing to submit these tests to another project or use another project
to run them is too much friction.

Also I think the goal of having tests that run on any kernel version is
a pipe dream. You'd absolutely need a way to encode which kernel
versions a test is expected to pass on because the tests might not make
sense until a feature is finished in upstream. And this makes it even
harder to develop these tests because, when we write them, we might not
even know which kernel version the feature will be added to. Similarly,
if a feature is removed or substantially changed, someone will have to
do a patch to disable the test for subsequent kernel versions and create
a new test for changed features. So, IMO, tests absolutely have to be
part of the kernel tree so they can be changed with the respective
features they test.

Kunit's ability to run without having to build and run the entire kernel
 is also a huge plus. (Assuming there's a way to get around the build
dependency issues). Because of this, it can be very quick to run these
tests which makes development a *lot* easier seeing you don't have to
reboot a machine every time you want to test a fix.

Logan
