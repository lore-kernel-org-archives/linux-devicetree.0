From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 0/6] ARM: STi reset controller support
Date: Tue, 25 Feb 2014 12:15:54 +0100
Message-ID: <1393326954.4156.3.camel@pizza.hi.pengutronix.de>
References: <1389696613-19683-1-git-send-email-srinivas.kandagatla@st.com>
						<1391437665-11913-1-git-send-email-srinivas.kandagatla@st.com>
					<1391592486.11239.4.camel@pizza.hi.pengutronix.de>
				 <52F4D76F.8070301@st.com> <5304B849.2080806@st.com>
			 <1393237988.3091.14.camel@pizza.hi.pengutronix.de>
			 <530B514A.4070209@st.com>
		 <1393254982.3091.44.camel@pizza.hi.pengutronix.de>
		 <530C5D8C.1080809@st.com>
	 <1393321661.4156.2.camel@pizza.hi.pengutronix.de> <530C76F0.8000909@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <530C76F0.8000909-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: srinivas kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stephen.gallimore-qxv4g6HH51o@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Srinivas,

Am Dienstag, den 25.02.2014, 10:56 +0000 schrieb srinivas kandagatla:
> Thankyou Philipp,
> On 25/02/14 09:47, Philipp Zabel wrote:
> >> No, the context is lost, the IP needs re-initialization.
> > alright then, I'll add them to the queue.
> Thats Great..
> Can I ask your Ack on these patches so that I can request Arnd/Olof to
> take these patches via arm-soc tree.
> 
> Hi Arnd/Olof,
> 
> I have few more DT patches which depend on the reset controller header
> file. Is is possible to take the reset controller patches with Philipp's
> Acks via arm-soc tree?

That's fine with me, too. Shall I back the patches out of the reset
queue, then?

Acked-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
