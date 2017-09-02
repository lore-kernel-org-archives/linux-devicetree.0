From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] devicetree: Remove remaining references/tests for
 "chosen@0"
Date: Sun, 03 Sep 2017 08:20:54 +1000
Message-ID: <1504390854.4974.108.camel@kernel.crashing.org>
References: <alpine.LFD.2.21.1709020416130.13598@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LFD.2.21.1709020416130.13598-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, Linux PPC Mailing List <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, 2017-09-02 at 04:43 -0400, Robert P. J. Day wrote:
> Since, according to a recent devicetree ML posting by Rob Herring,
> the node "/chosen@0" is most likely for real Open Firmware and does
> not apply to DTSpec, remove all remaining tests and references for
> that node, of which there are very few left:

Technically that would break Open Firmware systems where the node is
really called chosen@0

Now I'm not sure such a thing actually exist however.

My collection of DTs don't seem to have one, except in the ancient html
variants that were extracted by the pengionppc folks for the original
PowerMac 8600 but I wonder if that's a bug in the extraction script
since they also have @0 on /packages etc...

Ben.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
