From: Matthew McClintock <msm-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] When dumping from file system show results in sane order
Date: Mon, 11 Oct 2010 10:12:28 -0500
Message-ID: <A9F9C3E0-6D92-4DC1-9A10-7190987134FE@freescale.com>
References: <1286305641-23388-1-git-send-email-msm@freescale.com>
	<20101011055448.GL23588@angua.secretlab.ca>
Mime-Version: 1.0 (Apple Message framework v1081)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101011055448.GL23588-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Oct 11, 2010, at 12:54 AM, Grant Likely wrote:

> On Tue, Oct 05, 2010 at 02:07:21PM -0500, Matthew McClintock wrote:
>> Currently, when we run the following
>> 
>> $> dtc -I fs -O dts /proc/device-tree
>> 
>> We get the output in a "reverse order", this patch will reverse that
>> output order and should resemble your initial device more closely
>> 
>> Code copied over from kexec-tools
>> 
>> Signed-off-by: Matthew McClintock <msm-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> Hi Matthew.  David just posted a patch implementing a generic search
> option when outputting a tree in dts format which would be applicable
> to more use cases than just sucking up the fstree.  Would that do the
> job for you?
> 
> g.

I just noticed that, I suspect it will work. I will test it out and get back to everyone.

-M
