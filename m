From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: DTC in native FreeBSD environment
Date: Wed, 11 Nov 2009 09:25:11 -0600
Message-ID: <E1N8F4J-0000qK-TS@jdl.com>
References: <4AF9845B.4090403@semihalf.com>
	<20091110231452.GP26042@yookeroo.seuss>
	<F540B1B2-21F0-4F11-9578-F2B1201497B6@semihalf.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <F540B1B2-21F0-4F11-9578-F2B1201497B6-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org> 
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rafal Jaworowski <raj-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
Cc: Lukasz Wojcik <zbr-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org


OK, so, first up, I've copied the devicetree discuss list
for the rest of this conversation.  It should have started
there from the onset.

The bulk of this message is left as context for others now.
My comments at the bottom.


> On 2009-11-11, at 00:14, David Gibson wrote:
> 
> > On Tue, Nov 10, 2009 at 04:18:51PM +0100, Lukasz Wojcik wrote:
> >> Hello,
> >>
> >>  In relevence to our efforts to port DTC to native FreeBSD
> >> environment, we have to compile DTC parser using
> >> default FreeBSD tool -- YACC instead of Bison. That causes a
> >> problem, related with YACC/Bison compliance.
> >>
> >> To be more precise --  problems are caused by the %locations
> >> directive, and "yyloc".
> >>
> >> "yyloc" is used in dtc-parser.y to return the location of an
> >> erroneous expression in the device tree source file,
> >> when including a subset of binary file (incbin). Since YACC does not
> >> have %locations/yyloc feature, it is impossible to compile
> >> original code using YACC.
> >
> > Um.. right.  Tracking locations is a very useful feature though.  How
> > would we go about implementing it using portable yacc features?
> 
> Maybe it wasnt' clear enough. Yacc supports tracking locations in  
> general, the problem we have are around using bison internal variable  
> in the dtc parser i.e. yyloc.
> 
> >> After some research, I've managed to find out, that "yyloc" is an
> >> undocumented feature of Bison, and that it might not be
> >> maintained in future versions. I'm not a Bison/YACC differences
> >> specialist, and because of that I'd like to ask,
> >> whether you see a way how to avoid using thos Bison-internal
> >> construct in favour of something portable?
> >
> > Uh.. it's not undocumented.  I implemented everything I do with
> > %locations based on the info documentation.
> 
> Well, according to bison people 'yyloc' is internal variable and not  
> guaranteed to behave the same accross bison versions, and it's hardly  
> documented.. This is opposed to the 'yylloc', which is fine with yacc.  
> Could you please have a look whether the 'yyloc' is really necessary  
> and if we could not get away somehow with the 'yylloc'?
> 
> Rafal
> 

The use of locations, however spelled, is not going away.
In fact it the reverse is more likely as there will be
more development and use of the token position information.

If there is a more correct implementation, I will happily
accept a patch.

If there is a porting issue, I will happily accept
patches that improve the situation.

I am currently not running a FreeBSD system, so I can not
do that development work myself.  If you would like me to
do this work, talk to me privately.

jdl
