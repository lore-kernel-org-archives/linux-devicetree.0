From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/5] scripts: dtc: Merge in changes from the dtc repository
Date: Tue, 16 Nov 2010 22:59:55 -0700
Message-ID: <AANLkTinZ0yi-ZdwjG-KNcjXBuBzNMxrsFRJq4NZOiwk=@mail.gmail.com>
References: <20101116204917.12146.39851.stgit@riker>
	<20101116204951.12146.21084.stgit@riker>
	<AANLkTimTks01SnjWJZFycSCQC+ZBEonPLLUwMRQkxLz2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTimTks01SnjWJZFycSCQC+ZBEonPLLUwMRQkxLz2-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Kyle Moffett <kyle-hoO6YkzgTuCM0SS3m2neIg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 16, 2010 at 10:56 PM, Kyle Moffett <kyle-hoO6YkzgTuCM0SS3m2neIg@public.gmane.org> wrote:
> On Tue, Nov 16, 2010 at 15:49, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
>> Pull in recent changes from the main dtc repository. These changes primarily
>> allow multiple device trees to be declared which are merged by dtc. This
>> feature allows us to include a basic dts file and then provide more information
>> for the specific system through the merging functionality.
>
> Hmm, is there some documentation for how to use this feature?
> Specifically I have a custom board with multiple discrete computers on
> it which are only very slightly physically different from each other
> and I'd like to be able to avoid maintaining 2 nearly-exact copies of
> the same DTS file.

Not yet, but there will be.

g.
