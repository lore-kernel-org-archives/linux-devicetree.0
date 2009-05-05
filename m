From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: esdhc binding compatiable
Date: Tue, 5 May 2009 06:10:50 -0500
Message-ID: <E32EFA15-F5B3-4FFA-99AD-5972C0C195EF@kernel.crashing.org>
References: <54E4E37F-460A-4BB4-9DE1-670360D649A6@kernel.crashing.org>	<20090504211110.GC28413@ld0162-tx32.am.freescale.net>
	<20090504193416.7ec102bd.kim.phillips@freescale.com>
	<49FF914B.1080909@freescale.com>
Mime-Version: 1.0 (Apple Message framework v930.3)
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <49FF914B.1080909-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>, devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>>> not obvious that "fsl,esdhc" is really "fsl,esdhc-v1.0".
>> minor nit:  I'd remove the "-v" to make it "fsl,esdhc1.0".  It's  
>> really
>> no loss of clarity, and it saves space.
>
> I don't really care one way or another about the "v", but I like the  
> dash.  It looks a little too smooshed together without it.

Agreed, and it resolves things like ddr2-1.0 or ddr2-v1.0.

- k
