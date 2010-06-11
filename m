From: Dan Malek <ppc6dev-7kUUosv42bfn7oBBQGLwdg@public.gmane.org>
Subject: Re: Request review of device tree documentation
Date: Fri, 11 Jun 2010 16:47:26 -0700
Message-ID: <33BD8E86-9397-432A-97BF-F154812C157B@digitaldans.com>
References: <AANLkTilK4YkRMJqlcRDOAlGBzpdlZuSo9NF5NrRNocHT@mail.gmail.com>
Reply-To: microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Type: text/plain; charset="US-ASCII"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <owner-microblaze-uclinux-FR6EJeJVuqfA6Z3fQjNZrN9u6TNh0Fb7@public.gmane.org>
In-Reply-To: <AANLkTilK4YkRMJqlcRDOAlGBzpdlZuSo9NF5NrRNocHT-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: owner-microblaze-uclinux-FR6EJeJVuqfA6Z3fQjNZrN9u6TNh0Fb7@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, John Rigby <jcrigby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linuxppc-dev <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, Olof
 Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Hi Grant.

On Jun 11, 2010, at 3:59 PM, Grant Likely wrote:

> I've been doing a bit of work on some introductory level documentation
> of the flattened device tree.

Wow, I feel empowered to create device trees now :-)
Seriously, I never understood this well and this is a
great document.

I have one source of confusion.  Your first Initial structure
example uses 'compatible' to describe the machine, the
paragraph below then mentions the 'model' property,
and all subsequent examples use model.

Does this mean if I use just the single line in the dts,
using 'compatible' implies the ARM machine ID?  If I
have more description I use 'model'?

Thanks.

	-- Dan
