From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Date: Fri, 10 May 2019 15:13:40 -0700
Message-ID: <d148a554-2a71-a5a4-4bb2-d84d2c483277@gmail.com>
References: <a09a7e0e-9894-8c1a-34eb-fc482b1759d0@gmail.com>
 <20190509015856.GB7031@mit.edu>
 <580e092f-fa4e-eedc-9e9a-a57dd085f0a6@gmail.com>
 <20190509032017.GA29703@mit.edu>
 <7fd35df81c06f6eb319223a22e7b93f29926edb9.camel@oracle.com>
 <20190509133551.GD29703@mit.edu>
 <ECADFF3FD767C149AD96A924E7EA6EAF9770D591@USCULXMSG01.am.sony.com>
 <875c546d-9713-bb59-47e4-77a1d2c69a6d@gmail.com>
 <20190509214233.GA20877@mit.edu>
 <b09ba170-229b-fde4-3e9a-e50d6ab4c1b5@deltatee.com>
 <20190509233043.GC20877@mit.edu>
 <8914afef-1e66-e6e3-f891-5855768d3018@deltatee.com>
 <6d6e91ec-33d3-830b-4895-4d7a20ba7d45@gmail.com>
 <3faa022b-0b70-0375-aa6d-12ea83a2671f@deltatee.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
In-Reply-To: <3faa022b-0b70-0375-aa6d-12ea83a2671f-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.01.org/mailman/options/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/linux-nvdimm/>
List-Post: <mailto:linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
List-Help: <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=subscribe>
Errors-To: linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Sender: "Linux-nvdimm" <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
To: Logan Gunthorpe <logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>, Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>, Tim.Bird-7U/KSKJipcs@public.gmane.org, knut.omang-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, keescook-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, kieran.bingham-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, mcgrof-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, kunit-dev-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, linux-um-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alexander.Levin-0li6OtcxBFHby3iVrkZq2A@public.gmane.org, amir73il-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, jdike-OPE4K8JWMJJBDgjK7y7TUQ@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, julia.lawall-L2FTfq7BK8M@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org, pmladek-IBi9RG/b67k@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 5/10/19 9:17 AM, Logan Gunthorpe wrote:
> 
> 
> On 2019-05-09 11:18 p.m., Frank Rowand wrote:
> 
>> YES, kselftest has in-kernel tests.  (Excuse the shouting...)
> 
> Cool. From my cursory look, in my opinion, these would be greatly
> improved by converting them to the framework Brendan is proposing for Kunit.
> 
>>> If they do exists, it seems like it would make sense to
>>> convert those to kunit and have Kunit tests run-able in a VM or
>>> baremetal instance.
>>
>> They already run in a VM.
>>
>> They already run on bare metal.
>>
>> They already run in UML.
> 
> Simply being able to run in UML is not the only thing here. Kunit
> provides the infrastructure to quickly build, run and report results for
> all the tests from userspace without needing to worry about the details
> of building and running a UML kernel, then parsing dmesg to figure out
> what tests were run or not.

Yes.  But that is not the only environment that KUnit must support to be
of use to me for devicetree unittests (this is not new, Brendan is quite
aware of my needs and is not ignoring them).


>> This is not to say that KUnit does not make sense.  But I'm still trying
>> to get a better description of the KUnit features (and there are
>> some).
> 
> So read the patches, or the documentation[1] or the LWN article[2]. It's
> pretty well described in a lot of places -- that's one of the big
> advantages of it. In contrast, few people seems to have any concept of
> what kselftests are or where they are or how to run them (I was
> surprised to find the in-kernel tests in the lib tree).
> 
> Logan
> 
> [1] https://google.github.io/kunit-docs/third_party/kernel/docs/
> [2] https://lwn.net/Articles/780985/

I have been following the RFC versions.  I have installed the RFC patches
and run them to the extent that they worked (devicetree unittests were
a guinea pig for test conversion in the RFC series, but the converted
tests did not work).  I read portions of the code while trying to
understand the unittests conversion.  I made review comments based on
the portion of the code that I did read.  I have read the documentation
(very nice btw, as I have said before, but should be expanded).

My comment is that the description to submit the patch series should
be fuller -- KUnit potentially has a lot of nice attributes, and I
still think I have only scratched the surface.  The average reviewer
may have even less in-depth knowledge than I do.  And as I have
commented before, I keep diving into areas that I had no previous
experience with (such as kselftest) to be able to properly judge this
patch series.
