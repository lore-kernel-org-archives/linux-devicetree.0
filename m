From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v4 0/3] ARM: CSR: Adding CSR SiRFprimaII platform
Date: Thu, 7 Jul 2011 15:31:18 +0200
Message-ID: <201107071531.18623.arnd@arndb.de>
References: <1310020616-27856-1-git-send-email-bs14@csr.com>
	<201107071311.29643.arnd@arndb.de>
	<CAGsJ_4yd8i2V1FeKcELFrdRd+UxY9WLVV-dG9XnJmkxrYs8j5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAGsJ_4yd8i2V1FeKcELFrdRd+UxY9WLVV-dG9XnJmkxrYs8j5A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, workgroup.linux-kQvG35nSl+M@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 07 July 2011, Barry Song wrote:
> > Note that when you get a 'Reviewed-by', 'Acked-by' or 'Tested-by'
> > reply to one of your mails, you should add that in the patch
> > changelog below your own 'Signed-off-by' in order to document
> > it for the future. This ususally still holds true when you make
> > further changes, just not when rewriting major parts of the patch.
> 
> i am sure i know reviewed-by/acked-by/tested-by should be added to the
> end. what make me confused here is you are also the maintainer who
> will merge these changes into arm-soc and finally make them pulled by
> linus. generically,you will get the last signed-off-by too. if i list
> "reviewed-by you", you might need to replace it by signed-off-by
> finally.
> anyway, i'm really not sure whether i am understanding right about that :-)

The point is mostly that I tend to pull in patches from git, so I don't
add an explicit Signed-off-by to each patch. Also, the meaning of
Reviewed-by is stronger than just pulling a git tree, it means that
I looked at the code in much detail and am happy with the end result.

Simply pulling the patches can mean either that, or that I trust you
enough that I didn't bother looking (and/or don't care about the quality).

> > For the Signed-off-by list, that should normally include only the
> > people that have handled the specific patch, it doesn't imply
> > authorship. Having seven people listed as Signed-off-by seems a bit
> > strange in this context, but there is no clear rule against it.
> > I would probably use 'Acked-by' or plain 'Cc' in the changelog for
> > some of the people, depending in what way they were involved.
> 
> yes. i understand signed-off-by should only be given to people who
> make the essential code changes in the special patch and people who
> send or merge the special patch, but not the original author of the
> original source files. for the 1st patch which is the basic board
> support, in the long history of coding sirfprimaii, all the listed
> people have contributed codes. so i get the names of all of them
> shown. anyway, it is really too long....
> 

Not a problem. I basically wanted to make sure you know the rules,
and it seemed odd. It's probably ok to leave the list as it is.

	Arnd
