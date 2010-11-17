From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/7] OF: make drivers depend on CONFIG_OF instead of
	CONFIG_PPC_OF
Date: Tue, 16 Nov 2010 22:28:33 -0600
Message-ID: <4CE359F1.5000209@gmail.com>
References: <1289939635-30742-1-git-send-email-robherring2@gmail.com>	<1289939635-30742-2-git-send-email-robherring2@gmail.com>	<20101116204058.GA5016@angua.secretlab.ca>
	<20101117105945.64b3b656.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101117105945.64b3b656.sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Stephen,

On 11/16/2010 05:59 PM, Stephen Rothwell wrote:
> Hi Mitch,
>
> On Tue, 16 Nov 2010 13:40:58 -0700 Grant Likely<grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>  wrote:
>>
>> On Tue, Nov 16, 2010 at 02:33:49PM -0600, Rob Herring wrote:
>>> From: Rob Herring<rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>>>
>>> Some OF drivers could likely be used on non-powerpc OF based platforms,
>>> so fix the kconfig depends to be CONFIG_OF instead of CONFIG_PPC_OF
>>>
>>> Signed-off-by: Rob Herring<rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>>
>> Which of these drivers are you actually using, or going to use in the
>> near future?
>
> And have you made sure that you haven't broken the allmodconfig builds on
> other architectures that enable CONFIG_OF?
>

Well no as I don't have compilers for other arch's. The main OF platform 
to test here would be sparc as most of the kconfig options changed here 
already depend on PPC || MICROBLAZE.

I could simply have tacked on "|| ARM", but that seemed like the wrong 
thing to do. So I went down the path of looking at all OF drivers that 
could be used on other arch's.

Rob
