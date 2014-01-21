From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFC] Culling traffic volume on devicetree mailing list
Date: Tue, 21 Jan 2014 14:40:48 +0000
Message-ID: <CACxGe6vYMOnyeqdhaAggytxgiLH=ijNOrmuq2FyOUtZCGqfdgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi everyone,

Today on the devicetree conf call we (Rob, Ian and I) talked about
culling the volume of traffic on the devicetree list so that it would
be more useful to the DTC maintainers and non-Linux users like
freebsd. We'd like to propose creating the following two lists so that
those interested don't need to drink from the firehose:

devicetree-compiler: Specifically for discussing dt tooling topics
(parsing, schema validation, data format)

devicetree-spec: For discussing 'core' device tree bindings. ie.
anything that would be a candidate for putting into an ePAPR type
spec. Individual device bindings would continue to be posted to
devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, but anything affecting subsystems or
generic patterns should be posted to this new list.

Thoughts?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
